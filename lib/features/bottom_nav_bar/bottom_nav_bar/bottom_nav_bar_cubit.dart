import 'package:bloc/bloc.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_project/core/constants/app_icons.dart';
import 'package:mvp_project/core/theming/colors.dart';
import 'package:mvp_project/features/bottom_nav_bar/users/users_view.dart';
import '../profile/profile_view.dart';
import '../settings/dark_or_light_mode/dark_or_light_mode_cubit.dart';
import '../settings/dark_or_light_mode/dark_or_light_mode_state.dart';
import '../settings/settings_view.dart';
import 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  final DarkOrLightModeCubit themeCubit;

  BottomNavBarCubit({required this.themeCubit})
    : super(BottomNavBarStateInit());

  int index = 0;
  final GlobalKey<CurvedNavigationBarState> navigationKey = GlobalKey();

  final List<Widget> screens = <Widget>[UsersPage(), SettingsPage()];

  List<Widget> get items {
    final isDark =
        themeCubit.state is ThemeState
            ? (themeCubit.state as ThemeState).isDarkMode
            : false;

    return [
      Icon(
        Icons.person_2,
        color:
            index == 0
                ? Colors.white
                : (isDark ? Colors.white : ColorsManager.black),
        size: 30.sp,
      ),
      Icon(
        Icons.settings,
        color:
            index == 1
                ? Colors.white
                : (isDark ? Colors.white : ColorsManager.black),
        size: 30.sp,
      ),
    ];
  }

  void updateIndex(int newIndex) {
    index = newIndex;
    emit(UpdateIndex());
  }
}
