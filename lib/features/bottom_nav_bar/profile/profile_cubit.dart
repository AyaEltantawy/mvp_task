import 'dart:convert';
import 'dart:io';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';

import '../../../core/routing/page_router.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileStateInit()) {
    fetchUserData();
  }

  String phoneCode = '';
  TextEditingController namelController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String gender = '';
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isConnected = false;
  String? profileImageBase64;

  selectDropDownItem() {
    emit(SelectDropDownItem());
  }

  switchConnected() {
    isConnected = !isConnected;
    emit(SwitchConnected());
  }

  // Future<void> pickImage() async {
  //   final picker = ImagePicker();
  //   final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  //
  //   if (pickedFile != null) {
  //     final bytes = await pickedFile.readAsBytes();
  //     img.Image? image = img.decodeImage(bytes);
  //     if (image != null) {
  //       image = img.bakeOrientation(image);
  //       final fixedBytes = img.encodeJpg(image);
  //       profileImageBase64 = base64Encode(fixedBytes);
  //       emit(ProfileImagePicked());
  //     }
  //   }
  // }
  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      img.Image? image = img.decodeImage(bytes);
      if (image != null) {
        image = img.bakeOrientation(image);


        if (pickedFile.name.contains("front") || pickedFile.name.contains("selfie")) {
          image = img.flipHorizontal(image);
        }

        final fixedBytes = img.encodeJpg(image, quality: 80);
        profileImageBase64 = base64Encode(fixedBytes);
        emit(ProfileImagePicked());
      }
    }
  }

  Future<void> fetchUserData() async {
    emit(ProfileLoading());
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid == null) throw Exception("No user logged in");
      final doc =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      if (doc.exists) {
        final data = doc.data()!;
        namelController.text = data['name'] ?? '';
        emailController.text = data['email'] ?? '';
        gender = data['gender'] ?? '';
        phoneController.text = data['phone'] ?? '';
        bioController.text = data['bio'] ?? '';
        profileImageBase64 = data['profile_image'];
        emit(ProfileSuccess());
      } else {
        emit(ProfileError());
      }
    } catch (e) {
      emit(ProfileError());
    }
  }

  Future<void> editUserData() async {
    if (!formKey.currentState!.validate()) return;
    emit(ProfileLoading());

    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) throw Exception("No user logged in");

      final uid = user.uid;
      final updateData = {
        'name': namelController.text.trim(),
        'email': emailController.text.trim(),
        'phone': phoneController.text.trim(),
        'gender': gender,
        'bio': bioController.text.trim(),
      };

      if (profileImageBase64 != null) {
        updateData['profile_image'] = profileImageBase64!;
      }

      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .update(updateData);

      emit(ProfileSuccess());
      AnimatedSnackBar.material(
        'Changes saved',
        type: AnimatedSnackBarType.success,
      ).show(MagicRouter.currentContext);

      await fetchUserData();
      emit(ProfileStateInit());
    } catch (e) {
      emit(ProfileError());
    }
  }
}
