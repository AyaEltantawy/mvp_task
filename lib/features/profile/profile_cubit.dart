import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileStateInit());
  selectDropDownItem() {
    emit(SelectDropDownItem());
  }

  // File image;
  String phoneCode = '';
  TextEditingController namelController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String gender = '';
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isConnected = false;

  File? profileImage;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(ProfileImagePicked());
    } else {
      print("No image selected.");
    }
  }
  switchConnected() {
    isConnected = !isConnected;
    emit(SwitchConnected());
  }

}
