import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_project/core/theming/colors.dart';
import 'package:mvp_project/core/theming/styles.dart';
import 'dark_or_light_mode_cubit.dart';
import 'dark_or_light_mode_state.dart';

class DarkAndLightModePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DarkOrLightModeCubit, DarkOrLightModeState>(
      builder: (context, themeState) {
        final isDark = themeState is ThemeState ? themeState.isDarkMode : false;

        return Scaffold(
          backgroundColor: isDark ? ColorsManager.darkBackground : ColorsManager.background,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.dark_mode_outlined,
                      color: isDark ? ColorsManager.textWhite : ColorsManager.textBlack),
                  SizedBox(width: 10.w),
                  Text(
                    "Dark Mode",
                    style: isDark
                        ? TextStyles.font16White700Weight
                        : TextStyles.font16Black300Weight,
                  ),
                  const Spacer(),
                  Switch(
                    value: isDark,
                    onChanged: (value) {
                      context.read<DarkOrLightModeCubit>().toggleTheme();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
