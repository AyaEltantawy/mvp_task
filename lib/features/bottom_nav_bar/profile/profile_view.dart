import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mvp_project/features/bottom_nav_bar/profile/profile_cubit.dart';
import 'package:mvp_project/features/bottom_nav_bar/profile/profile_state.dart';

import '../../../core/shared_widgets/custom_button.dart';
import '../../../core/shared_widgets/custom_text_form_feild.dart';
import '../../../core/theming/colors.dart';
import '../../../core/theming/styles.dart';
import '../settings/dark_or_light_mode/dark_or_light_mode_cubit.dart';
import '../settings/dark_or_light_mode/dark_or_light_mode_state.dart';

class ProfilePage extends StatelessWidget {
  List<String> _dropDownItems = ["Male", "Female"];
  String? _selectedItem;

  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark =
        context.watch<DarkOrLightModeCubit>().state is ThemeState
            ? (context.watch<DarkOrLightModeCubit>().state as ThemeState)
                .isDarkMode
            : false;
    return BlocProvider(
      create: (BuildContext context) => ProfileCubit(),
      child: Scaffold(
        backgroundColor:
            isDark ? ColorsManager.darkBackground : ColorsManager.background,
        body: SafeArea(
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              final controller = BlocProvider.of<ProfileCubit>(context);
              return Form(
                key: controller.formKey,
                child: ListView(
                  padding: EdgeInsets.symmetric(
                    vertical: 20.h,
                    horizontal: 20.w,
                  ),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Profile",
                          style:
                              isDark
                                  ? TextStyles.font30White700Weight
                                  : TextStyles.font20black700Weight,
                        ),
                        SizedBox(width: 20.h),
                        Image.asset(
                          "assets/images/success-logo-design-template-vector.jpg",
                          width: 50.w,
                          height: 50.w,
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "Control your profile",
                      style: TextStyles.font15Thirdgrey300Weight,
                    ),
                    const Divider(thickness: 1, color: ColorsManager.mainblue),
                    SizedBox(height: 10.h),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 150.w,
                          height: 150.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  controller.profileImageBase64 != null
                                      ? MemoryImage(
                                        base64Decode(
                                          controller.profileImageBase64!,
                                        ),
                                      )
                                      : const AssetImage(
                                            "assets/images/girl_photo_in_settings.png",
                                          )
                                          as ImageProvider,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10.h,
                          right: 105.w,
                          child: GestureDetector(
                            onTap: () => controller.pickImage(),
                            child: SvgPicture.asset(
                              "assets/svgs/blue_camera_icon.svg",
                            ),
                          ),
                        ),
                      ],
                    ),
                    CustomTextFormFeild(
                      colorText: isDark ? Colors.white : ColorsManager.black,
                      prefixIcon: SvgPicture.asset("assets/svgs/user_icon.svg"),
                      hint: "name",

                      upperText: "Name",
                      controller: controller.namelController,
                    ),
                    CustomTextFormFeild(
                      colorText: isDark ? Colors.white : ColorsManager.black,
                      prefixIcon: SvgPicture.asset("assets/svgs/user_icon.svg"),
                      hint: "bio",
                      upperText: "Bio",

                      controller: controller.bioController,
                    ),
                    CustomTextFormFeild(
                      colorText: isDark ? Colors.white : ColorsManager.black,
                      upperText: "Email Address",
                      prefixIcon: SvgPicture.asset(
                        "assets/svgs/email_icon.svg",
                      ),
                      hint: "Email Address",
                      controller: controller.emailController,
                    ),
                    Text(
                      "Phone Number",
                      style:
                          isDark
                              ? TextStyles.font16White700Weight
                              : TextStyles.font14blackWei400ght,
                    ),
                    IntlPhoneField(
                      dropdownTextStyle:
                          isDark
                              ? TextStyles.font16Black300Weight
                              : TextStyles.font16Black300Weight,
                      style:
                          isDark
                              ? TextStyles.font16Black300Weight
                              : TextStyles.font16Black300Weight,
                      controller: controller.phoneController,
                      onChanged: (phone) {
                        controller.phoneCode = phone.countryCode;
                      },
                      decoration: InputDecoration(
                        fillColor: ColorsManager.lightgrey,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.blue),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.blue),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                      initialCountryCode: 'EG',
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "Gender",
                      style:
                          isDark
                              ? TextStyles.font16White700Weight
                              : TextStyles.font16Black300Weight,
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      child: DropdownButton<String>(
                        value:
                            controller.gender.isNotEmpty
                                ? controller.gender
                                : null,
                        underline: SizedBox(),

                        dropdownColor: isDark ? Colors.white : Colors.white,

                        style: TextStyle(
                          color:
                              isDark
                                  ? ColorsManager.black
                                  : ColorsManager.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),

                        hint: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Text(
                            "gender",
                            style:
                                isDark
                                    ? TextStyles.font30White700Weight
                                    : TextStyles.font30Black700Weight,
                          ),
                        ),
                        items:
                            _dropDownItems.map((String item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10.w),
                                  child: Text(item),
                                ),
                              );
                            }).toList(),
                        onChanged: (String? value) {
                          controller.gender = value ?? '';
                          _selectedItem = value;
                          controller.selectDropDownItem();
                        },
                      ),
                    ),

                    SizedBox(height: 10.h),
                    Text(
                      "Link Personal account",
                      style:
                          isDark
                              ? TextStyles.font16White700Weight
                              : TextStyles.font14Secondblack400Weight,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/svgs/google_icon_without_container.svg",
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.w, right: 20.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Google",
                                  style:
                                      isDark
                                          ? TextStyles.font16White700Weight
                                          : TextStyles.font20black700Weight,
                                ),
                                Text(
                                  controller.isConnected
                                      ? "Connected"
                                      : "DisConnected",
                                  style:
                                      controller.isConnected
                                          ? TextStyles.font11Green400Weight
                                          : TextStyles.font11Red400Weight,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Text(
                              controller.emailController.text,
                              style: TextStyles.font13Icongrey400Weight,
                            ),
                          ),
                          CupertinoSwitch(
                            value: controller.isConnected,
                            onChanged:
                                (bool value) => controller.switchConnected(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    state is ProfileLoading
                        ? const SpinKitThreeBounce(
                          color: ColorsManager.mainblue,
                          size: 26.0,
                        )
                        : CustomButton(
                          onPressed: () => controller.editUserData(),
                          child: Text(
                            "Save Changes",
                            style: TextStyles.font16White700Weight,
                          ),
                        ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
