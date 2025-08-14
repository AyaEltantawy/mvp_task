import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_project/features/bottom_nav_bar/settings/dark_or_light_mode/dark_or_light_mode_state.dart';
import '../../../core/theming/colors.dart';
import '../settings/dark_or_light_mode/dark_or_light_mode_cubit.dart';
import 'bottom_nav_bar_cubit.dart';
import 'bottom_nav_bar_state.dart';

class BottomNavBarPage extends StatelessWidget {
  const BottomNavBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<DarkOrLightModeCubit>();
    return BlocProvider<BottomNavBarCubit>(
      create: (_) => BottomNavBarCubit(themeCubit: themeCubit),
      child: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
        builder: (context, state) {
          final controller = context.read<BottomNavBarCubit>();
          double navBarHeight = 50.h;
          if (navBarHeight > 75) navBarHeight = 75;

          return BlocBuilder<DarkOrLightModeCubit, DarkOrLightModeState>(
            builder: (context, themeState) {
              final isDark =
                  themeState is ThemeState ? themeState.isDarkMode : false;
              return Scaffold(
                backgroundColor:
                    isDark
                        ? ColorsManager.darkBackground
                        : ColorsManager.background,
                body: controller.screens[controller.index],
                bottomNavigationBar: CurvedNavigationBar(
                  key: controller.navigationKey,
                  items: controller.items,
                  backgroundColor: Colors.transparent,
                  index: controller.index,
                  animationDuration: const Duration(milliseconds: 600),
                  height: navBarHeight,
                  onTap: (index) => controller.updateIndex(index),
                  buttonBackgroundColor: ColorsManager.mainblue,
                  animationCurve: Curves.decelerate,
                  color: isDark ? ColorsManager.secondblack : Colors.white,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
