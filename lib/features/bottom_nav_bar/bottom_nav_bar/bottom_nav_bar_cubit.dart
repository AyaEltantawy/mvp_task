import 'package:bloc/bloc.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_project/core/constants/app_icons.dart';
import 'package:mvp_project/core/theming/colors.dart';
import 'package:mvp_project/features/bottom_nav_bar/users/users_view.dart';

import '../profile/profile_view.dart';
import 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarStateInit());

  int index = 0;
  final GlobalKey<CurvedNavigationBarState> navigationKey = GlobalKey();

  final List<Widget> screens = <Widget>[UsersPage(), ProfilePage()];

  List<Widget> get items => <Widget>[
    Icon(
      Icons.person_2,
      color: index == 0 ? Colors.white : ColorsManager.black,
      size: 30.sp,
    ),

    Icon(
      Icons.settings,
      size: 30.sp,
      color: index == 1 ? Colors.white : ColorsManager.black,
    ),
  ];

  void updateIndex(int newIndex) {
    index = newIndex;
    emit(UpdateIndex());
  }
}
