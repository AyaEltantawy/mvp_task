import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_project/core/theming/colors.dart';

import 'splash_cubit.dart';
import 'splash_state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (BuildContext context) => SplashCubit()..navigate(),
      child: Scaffold(
        backgroundColor: ColorsManager.mainblue,
        body: Center(
          child: Image.asset(
            "assets/images/success-logo-design-template-vector.jpg",
            width: 224.w,
            height: 228.05.h,
          ),
        ),
      ),
    );
  }
}
