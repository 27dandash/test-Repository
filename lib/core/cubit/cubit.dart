import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:fawry_app/core/network/Fawrymodel.dart';
import 'package:fawry_app/core/network/remote/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fawry_app/core/cubit/state.dart';
import '../../translation.dart';
import '../components/constants.dart';
import '../network/local/SharedPreferences.dart';
import '../network/remote/endPoints.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility_rounded;
  bool isPasswordShow = true;
  int currentIndex = 0;

  int? maxLines;
  bool seeMore = true;

  // ----------------------------------------- AppTheme
  bool AppTheme = false;

  void onchangeappmode({bool? formShared}) {
    emit(ChangeThemeloadState());
    if (formShared != null) {
      AppTheme = formShared;
      emit(ChangeThemeSuccessState());
    } else {
      AppTheme = !AppTheme;
      CacheHelper.saveData(key: 'Isdark', value: AppTheme).then((value) {
        emit(ChangeThemeSuccessState());
      });
    }
  }

// ---------------------------------------- Translation
  void changeLanguage() async {
    isRtl = !isRtl;

    CacheHelper.saveData(key: 'isRtl', value: isRtl);
    String translation = await rootBundle
        .loadString('assets/translations/${isRtl ? 'ar' : 'en'}.json');
    setTranslation(
      translation: translation,
    );

    emit(ChangeLanguageState());
  }

  late TranslationModel translationModel;

  void setTranslation({
    required String translation,
  }) {
    translationModel = TranslationModel.fromJson(json.decode(
      translation,
    ));
    emit(LanguageLoaded());
  }

  // ------------------------------------ no internet

  bool noInternetConnection = false;

  void checkConnectivity() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      debugPrint('Internet Connection ------------------------');
      debugPrint('${result.index}');
      debugPrint(result.toString());
      if (result.index == 0 || result.index == 1) {
        noInternetConnection = false;
      } else if (result.index == 2) {
        noInternetConnection = true;
      }

      emit(InternetState());
    });
  }

  void checkInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      noInternetConnection = false;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      noInternetConnection = false;
    } else {
      noInternetConnection = true;
    }
    emit(InternetState());
  }

// ---------------------------------------- change cart


  List<dynamic> busniss = [];

  void getbusniss() {
    if (busniss.length == 0) {
      emit(FawryGetDataState());
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '975d7b6f1c9e47dcac206301a11ec09e',
      }).then((value) {
        //print(value.data.toString());
        print('###########FawryGetSuccessDataState##################');
        busniss = value.data['articles'];
        print(busniss[0]['title']);
        emit(FawryGetSuccessDataState());
      }).catchError((error) {
        print('error is ${error.toString()}');
        emit(FawryGetErrorDataState(error.toString()));
      });
    } else {
      emit(FawryGetSuccessDataState());
    }
  }


  // FawryModel ? fawry;
  //
  // void getData() {
  //   emit(FawryGetDataState());
  //   DioHelper.getData(url: HomeEndPoint).then((value) {
  //     // value.for
  //     fawry = FawryModel.fromJson(value.data['data']);
  //     print('#################Succesdddds##########');
  //
  //     print(fawry?.name![1]);
  //     print(fawry?.cityDataModels![1]);
  //     emit(FawryGetSuccessDataState());
  //   }).catchError((error) {
  //     print('#################error##########');
  //     print(error.toString());
  //     emit(FawryGetErrorDataState(error.toString()));
  //   });
  // }
}
