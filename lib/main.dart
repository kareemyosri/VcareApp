import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/auth/data/repo/home_repo_imple.dart';
import 'package:my_app/auth/manager/cubit/authrization_cubit.dart';
import 'package:my_app/city/data/repo/home_repo_imple.dart';
import 'package:my_app/city/manager/cubit/city_cubit.dart';
import 'package:my_app/history/data/repo/home_repo_impel.dart';
import 'package:my_app/history/manager/history_cubit.dart';
import 'package:my_app/shared/my_shared.dart';
import 'package:my_app/util/api_server.dart';
import 'package:my_app/util/app_const.dart';
import 'package:my_app/util/app_router.dart';
import 'package:my_app/util/bloc_opserve.dart';
import 'package:my_app/util/cubit/cubit/show_password_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MySharedPrefrence.init();
  ApiService.init();
  
  Bloc.observer = const AppBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
      BlocProvider(
          create: (context) => HistoryCubit(
            HomeRepoImpleForHistory(apiService: ApiService())
          )
    //      lazy: false,
        ),
        BlocProvider(
          create: (context) => ShowPasswordCubit(),
        ),
        BlocProvider(
          create: (context) => CityCubit(
           HomeRepoImpleForCity(apiService: ApiService(),),
          )..getAllCity(),
        ),
        BlocProvider(
          create: (context) => AuthrizationCubit(
            HomeRepoImple(
              apiService: ApiService(),
            ),
          ),
        )
        
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(scaffoldBackgroundColor: Colors.white),
            onGenerateRoute: AppRouter.generateRoute,
            initialRoute:
            MySharedPrefrence.get(key: AppConst.savePassword) == true
                ? AppRouter.homescreen
                : AppRouter.loginScreen,
            ),
      ),
    );
  }
}
