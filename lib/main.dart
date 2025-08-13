import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_project/features/profile/profile_view.dart';
import 'package:mvp_project/features/splash/splash/splash_view.dart';

import 'core/routing/page_router.dart';
import 'core/routing/routes.dart';
import 'features/auth/login/login_view.dart';
import 'features/auth/register/register_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,

      child: MaterialApp(
        title: 'MVP Task',
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case Routes.loginPage:
              return MaterialPageRoute(builder: (_) => const LoginPage());
            case Routes.profilePage:
              return MaterialPageRoute(builder: (_) => ProfilePage());
            case Routes.register:
              return MaterialPageRoute(builder: (_) => RegisterPage());
          }
        },

        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: SplashPage(),
      ),
    );
  }
}
