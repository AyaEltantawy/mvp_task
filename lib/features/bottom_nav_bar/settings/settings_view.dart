import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_project/features/bottom_nav_bar/profile/profile_view.dart';

import '../../../core/constants/app_icons.dart';
import '../../../core/theming/colors.dart';
import '../../../core/theming/styles.dart';

import 'components/app_settings_tile.dart';

import 'dark_or_light_mode/dark_or_light_mode_cubit.dart';
import 'dark_or_light_mode/dark_or_light_mode_state.dart';
import 'dark_or_light_mode/dark_or_light_mode_view.dart';
import 'settings_cubit.dart';
import 'settings_state.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SettingsCubit(),
      child: BlocBuilder<DarkOrLightModeCubit, DarkOrLightModeState>(
        builder: (context, themeState) {
          final isDark = themeState is ThemeState ? themeState.isDarkMode : false;
          return Scaffold(backgroundColor: isDark
              ? ColorsManager.darkBackground
              : ColorsManager.background,
            body: SafeArea(

              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Settings", style:isDark?  TextStyles.font16White700Weight: TextStyles.font20black700Weight),
                      SizedBox(width: 20.h),
                      Image.asset(
                        "assets/images/success-logo-design-template-vector.jpg",
                        width: 50.w,
                        height: 50.w,
                      ),
                    ],
                  ),
                  const Divider(thickness: 1, color: ColorsManager.mainblue),
                  SizedBox(height: 20.h),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfilePage()),
                      );
                    },
                    child: AppSettingsListTile(
                      style: TextStyles.font16White700Weight,

                      widget: Icon(Icons.person, color: Colors.white,),
                      label: 'Profile',
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                            DarkAndLightModePage()),
                      );
                    },
                    child: AppSettingsListTile(
                      style: TextStyles.font16White700Weight,

                      widget: Icon(Icons.dark_mode, color: Colors.white,),
                      label: 'DarkMode',
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
