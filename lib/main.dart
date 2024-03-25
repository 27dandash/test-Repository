import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fawry_app/core/theme/app_theme.dart';
import 'core/components/constants.dart';
import 'core/cubit/cubit.dart';
import 'core/cubit/state.dart';
import 'core/network/local/SharedPreferences.dart';
import 'core/network/remote/bloc_observer.dart';
import 'core/network/remote/dio_helper.dart';
import 'features/tapbar/presentation/controlles/cubit.dart';
import 'features/tapbar/presentation/screens/tapbar_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  SharedPreferences.getInstance();
  bool? isdark = CacheHelper.getData(key: 'Isdark');
  // Widget widget;
  // bool onBoarding = CacheHelper.getData(key: 'onBoarding') == null
  //     ? false
  //     : CacheHelper.getData(key: 'onBoarding');
  // token = CacheHelper.getData(key: 'uId');
  // isRtl = CacheHelper.getData(key: 'isRtl');
  // String translation = await rootBundle
  // //     .loadString('assets/translations/${isRtl ? 'ar' : 'en'}.json');

  // if (onBoarding == false) {
  //   if (token != null) {
  //     widget = const HomeLayOut();
  //     print(token);
  //   } else
  //     widget = splash();
  // } else
  //   widget = splash();

  runApp(MyApp(
    // startWidget: widget,
    // isRtl: isRtl,
    // translation: translation,
    isdark: isdark,
  ));
}

class MyApp extends StatelessWidget {
  final bool? isdark;
  //
  // // final Widget startWidget;
  // final bool isRtl;
  // final String translation;

  MyApp(
      {
      // required this.startWidget,
      // required this.isRtl,
      required this.isdark,
      // required this.translation
      });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(
            create: (BuildContext context) => AppCubit()
              // ..setTranslation(translation: translation)
              ..checkConnectivity()
              ..getbusniss()
              ..onchangeappmode(
                formShared: isdark,
              )),
        BlocProvider<TapbarCubit>(
            create: (BuildContext context) => TapbarCubit()),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme().lightTheme,
            darkTheme: AppTheme().darkTheme,
            themeMode: cubit.AppTheme ? ThemeMode.light : ThemeMode.dark,
            home: tapbar_view(),
            // home: startWidget,
          );
        },
      ),
    );
  }
}


