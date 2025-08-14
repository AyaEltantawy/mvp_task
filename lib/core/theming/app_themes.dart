import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvp_project/core/theming/colors.dart';

class AppTheme {
  static ThemeData get defaultTheme {
    return ThemeData(
      colorSchemeSeed: ColorsManager.primary,
      fontFamily: "Tajawal",
      textTheme: TextTheme(
        labelMedium: TextStyle(color: ColorsManager.textBlack, fontSize: 16.sp),
        bodyLarge: TextStyle(color: ColorsManager.textBlack, fontSize: 18.sp),
        bodyMedium: TextStyle(color: ColorsManager.textBlack, fontSize: 18.sp),
        headlineLarge: TextStyle(color: ColorsManager.textBlack),
        bodySmall: TextStyle(color: ColorsManager.textBlack),
        titleLarge: TextStyle(color: ColorsManager.textBlack),
        titleMedium: TextStyle(color: ColorsManager.textBlack),
        titleSmall: TextStyle(color: ColorsManager.textBlack),
        labelSmall: TextStyle(color: ColorsManager.textBlack),
        displayLarge: TextStyle(color: ColorsManager.textBlack),
        displayMedium: TextStyle(color: ColorsManager.textBlack),
        displaySmall: TextStyle(color: ColorsManager.textBlack),
        headlineMedium: TextStyle(color: ColorsManager.textBlack),
        headlineSmall: TextStyle(color: ColorsManager.textBlack),
        labelLarge: TextStyle(color: ColorsManager.textBlack),
      ),
      scaffoldBackgroundColor: ColorsManager.background,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: ColorsManager.primary,
        foregroundColor: ColorsManager.primary,
        focusColor: ColorsManager.primary,
        hoverColor: ColorsManager.primary,
        splashColor: ColorsManager.primary,
      ),
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
        elevation: 0.3,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: GoogleFonts.tajawal(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: ColorsManager.textWhite,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsManager.primary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.all(10),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.sp),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.all(10.sp),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.sp),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: GoogleFonts.tajawal(fontWeight: FontWeight.bold),
        ),
      ),
      inputDecorationTheme: defaultInputDecorationTheme,
      sliderTheme: const SliderThemeData(
        showValueIndicator: ShowValueIndicator.always,
        thumbColor: Colors.white,
      ),
      tabBarTheme: TabBarThemeData(
        labelColor: ColorsManager.primary,
        unselectedLabelColor: ColorsManager.placeholder,
        labelPadding: const EdgeInsets.all(10),
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle: GoogleFonts.tajawal(
          fontWeight: FontWeight.bold,
          // remove color here
        ),
        unselectedLabelStyle: GoogleFonts.tajawal(
          fontWeight: FontWeight.bold,
          // remove color here
        ),
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: ColorsManager.primary, width: 2),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      fontFamily: "Tajawal",
      primaryColor: Colors.black,
      primaryColorLight: Colors.black,
      primaryColorDark: Colors.black,
      indicatorColor: Colors.white,
      canvasColor: Colors.black,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: ColorsManager.primary,
        foregroundColor: ColorsManager.primary,
        focusColor: ColorsManager.primary,
        hoverColor: ColorsManager.primary,
        splashColor: ColorsManager.primary,
      ),
      textTheme: TextTheme(
        labelMedium: TextStyle(color: Colors.white, fontSize: 16.sp),
        bodyLarge: TextStyle(color: Colors.white, fontSize: 18.sp),
        bodyMedium: TextStyle(color: Colors.white, fontSize: 18.sp),
        headlineLarge: TextStyle(color: Colors.white),
        bodySmall: TextStyle(color: Colors.white),
        titleLarge: TextStyle(color: Colors.white),
        titleMedium: TextStyle(color: Colors.white),
        titleSmall: TextStyle(color: Colors.white),
        labelSmall: TextStyle(color: Colors.white),
        displayLarge: TextStyle(color: Colors.white),
        displayMedium: TextStyle(color: Colors.white),
        displaySmall: TextStyle(color: Colors.white),
        headlineMedium: TextStyle(color: Colors.white),
        headlineSmall: TextStyle(color: Colors.white),
        labelLarge: TextStyle(color: Colors.white),
      ),
      scaffoldBackgroundColor: ColorsManager.darkBackground,
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        elevation: 0.3,
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: GoogleFonts.tajawal(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
    );
  }

  /* <---- Input Decorations Theme -----> */
  static final defaultInputDecorationTheme = InputDecorationTheme(
    fillColor: ColorsManager.textInputBackground,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    border: OutlineInputBorder(
      borderSide: BorderSide(width: 0.1),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 0.1),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 0.1),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    suffixIconColor: ColorsManager.placeholder,
  );

  static final secondaryInputDecorationTheme = InputDecorationTheme(
    fillColor: ColorsManager.textInputBackground,
    filled: true,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
    focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
  );

  static final otpInputDecorationTheme = InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.never,
    border: OutlineInputBorder(
      borderSide: const BorderSide(width: 0.1),
      borderRadius: BorderRadius.circular(25),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(width: 0.1),
      borderRadius: BorderRadius.circular(25),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(width: 0.1),
      borderRadius: BorderRadius.circular(25),
    ),
  );
}
