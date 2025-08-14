import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_project/features/splash/splash/splash_view.dart';

import 'core/cache_helper/cache_helper.dart' show CacheHelper;
import 'core/routing/page_router.dart';
import 'core/routing/routes.dart';
import 'core/theming/app_themes.dart';
import 'features/auth/login/login_view.dart';
import 'features/auth/register/register_view.dart';
import 'features/bottom_nav_bar/profile/profile_view.dart';
import 'features/bottom_nav_bar/settings/dark_or_light_mode/dark_or_light_mode_cubit.dart';
import 'features/bottom_nav_bar/settings/dark_or_light_mode/dark_or_light_mode_state.dart';
import 'features/bottom_nav_bar/settings/settings_cubit.dart';
import 'features/bottom_nav_bar/users/users_cubit.dart';

var globalDark = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  globalDark = CacheHelper.getData(key: 'isDark') ?? false;
  await Firebase.initializeApp();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<UsersCubit>(create: (_) => UsersCubit()),

        BlocProvider<SettingsCubit>(create: (_) => SettingsCubit()),
        BlocProvider<DarkOrLightModeCubit>(
          create: (_) => DarkOrLightModeCubit(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.white,
      ),
    );

    return BlocBuilder<DarkOrLightModeCubit, DarkOrLightModeState>(
      builder: (context, state) {
        final isDark = (state is ThemeState) ? state.isDarkMode : false;

        return ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          builder:
              (_, __) => MaterialApp(
                title: 'MVP Task',
                debugShowCheckedModeBanner: false,
                navigatorKey: navigatorKey,
                onGenerateRoute: (settings) {
                  switch (settings.name) {
                    case Routes.loginPage:
                      return MaterialPageRoute(
                        builder: (_) => const LoginPage(),
                      );
                    case Routes.profilePage:
                      return MaterialPageRoute(builder: (_) => ProfilePage());
                    case Routes.register:
                      return MaterialPageRoute(builder: (_) => RegisterPage());
                    default:
                      return null;
                  }
                },
                theme: AppTheme.defaultTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
                home: const SplashPage(),
              ),
        );
      },
    );
  }
}
