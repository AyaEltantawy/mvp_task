import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../core/routing/page_router.dart';
import '../../../core/routing/routes.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterStateInit());
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isChecked = false;

  selectDropDownItem() {
    emit(SelectDropDownItem());
  }

  Future<void> signUp() async {
    if (!formKey.currentState!.validate()) return;

    try {
      emit(LoadingRegister());

      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );

      final uid = userCredential.user?.uid;
      if (uid != null) {
        await FirebaseFirestore.instance.collection('users').doc(uid).set({
          'name': nameController.text.trim(),
          'gender': gender,
          'email': emailController.text.trim(),
          'phone': phoneController.text.trim(),
          'password': passwordController.text.trim(),
          'bio': "",


        });
      }

      emit(RegisterStateInit());

      MagicRouter.namedNavigation(Routes.profilePage);

      AnimatedSnackBar.material(
        'Account created!',
        type: AnimatedSnackBarType.success,
      ).show(MagicRouter.currentContext);
    } on FirebaseAuthException catch (e) {
      emit(RegisterStateInit());
      AnimatedSnackBar.material(
        e.message ?? 'Registration failed',
        type: AnimatedSnackBarType.error,
      ).show(MagicRouter.currentContext);
    } catch (e) {
      emit(RegisterStateInit());
      AnimatedSnackBar.material(
        'Unexpected error',
        type: AnimatedSnackBarType.error,
      ).show(MagicRouter.currentContext);
    }
  }

  bool isPasswordShownFirst = false;

  void onPassShowClickedFirst() {
    isPasswordShownFirst = !isPasswordShownFirst;
    emit(OnPassShowClicked());
  }

  bool isPasswordShownSecond = false;

  void onPassShowClickedSecond() {
    isPasswordShownSecond = !isPasswordShownSecond;
    emit(OnPassShowClicked());
  }

  String gender = '';
  String phoneCode = 'eg';

  void toggleCheckbox() {
    isChecked = !isChecked;
    emit(CheckBoxUpdate());
  }
}
