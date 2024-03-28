import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fawry_app/core/theme/app_theme.dart';
import 'core/cubit/cubit.dart';
import 'core/cubit/state.dart';
import 'core/network/local/SharedPreferences.dart';
import 'core/network/remote/bloc_observer.dart';
import 'core/network/remote/dio_helper.dart';
import 'features/onboarding/presentation/controlles/cubit.dart';
import 'features/product/presentation/components/property_tap_view.dart';
import 'features/product/presentation/controlles/cubit.dart';
import 'features/product/presentation/screens/body_product_detail.dart';
import 'features/product/presentation/screens/product_detail_view.dart';
import 'features/tapbar/presentation/controlles/cubit.dart';
import 'features/tapbar/presentation/screens/tapbar_view.dart';
import 'features/try.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  SharedPreferences.getInstance();
  bool? isdark = CacheHelper.getData(key: 'Isdark');

  runApp(MyApp(

    isdark: isdark,
  ));
}

class MyApp extends StatelessWidget {
  final bool? isdark;


  MyApp(
      {

      required this.isdark,
      });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(
            create: (BuildContext context) => AppCubit()
              ..checkConnectivity()
              ..getbusniss()
              ..onchangeappmode(
                formShared: isdark,
              )),
        BlocProvider<ProductCubit>(
            create: (BuildContext context) => ProductCubit()),
        BlocProvider<TapbarCubit>(
            create: (BuildContext context) => TapbarCubit()),
        BlocProvider<OnBoardingCubit>(
            create: (BuildContext context) => OnBoardingCubit()),

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
            home:  BodyProductDetails(),
            // home:  ExamplePage(),
            // home: startWidget,
          );
        },
      ),
    );
  }
}


