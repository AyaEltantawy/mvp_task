import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:mvp_project/features/auth/login/login_view.dart';

import '../../../core/routing/page_router.dart';
import '../../../core/routing/routes.dart';
import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState().init());

  navigate() {
    Future.delayed(const Duration(seconds: 3), () {
      MagicRouter.namedNavigation(Routes.loginPage);
    });
  }
}
