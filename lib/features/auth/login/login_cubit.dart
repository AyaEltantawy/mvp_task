import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/routing/page_router.dart';
import '../../../core/routing/routes.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginStateInit());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPasswordShown = false;

  void onPassShowClicked() {
    isPasswordShown = !isPasswordShown;
    emit(OnPassShowClicked());
  }
  final auth = FirebaseAuth.instance;
  late String email;
  late String password;

  Future<void> login() async {
    try {
      emit(LoadingLogin());
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: emailController.text.toString(),
        password: passwordController.text.toString(),
      );
emit(LoadingSuccess());
      MagicRouter.namedNavigation(Routes.profilePage);
      AnimatedSnackBar.material(
        'success',
        type: AnimatedSnackBarType.success,
      ).show(MagicRouter.currentContext);
    } catch (e) {
      emit(LoadingError());
      AnimatedSnackBar.material(
        'error',
        type: AnimatedSnackBarType.error,
      ).show(MagicRouter.currentContext);
    }

  }
}