import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../core/constants/app_icons.dart';
import '../../../core/routing/page_router.dart';
import '../../../core/routing/routes.dart';
import '../../../core/shared_widgets/custom_button.dart';
import '../../../core/shared_widgets/custom_text_button.dart';
import '../../../core/shared_widgets/custom_text_form_feild.dart';
import '../../../core/theming/colors.dart';
import '../../../core/theming/styles.dart';
import '../../../main.dart';
import '../../bottom_nav_bar/settings/dark_or_light_mode/dark_or_light_mode_cubit.dart';
import '../../bottom_nav_bar/settings/dark_or_light_mode/dark_or_light_mode_state.dart';
import 'register_cubit.dart';
import 'register_state.dart';

class RegisterPage extends StatelessWidget {
  List<String> _dropDownItems = ["Male", "Female"];
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<RegisterCubit, RegisterState>(
            builder: (context, state) {
              final controller = BlocProvider.of<RegisterCubit>(context);
              return BlocBuilder<DarkOrLightModeCubit, DarkOrLightModeState>(
                builder: (context, themeState) {
                  final isDark =
                      themeState is ThemeState ? themeState.isDarkMode : false;

                  if (themeState is ThemeState) {
                    globalDark = themeState.isDarkMode;
                  }
                  return Form(
                    key: controller.formKey,
                    child: ListView(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Create New Account",
                              style:
                                  isDark
                                      ? TextStyles.font30White700Weight
                                      : TextStyles.font30Black700Weight,
                            ),
                            SizedBox(height: 10.h),
                            Image.asset(
                              "assets/images/success-logo-design-template-vector.jpg",
                              width: 50.w,
                              height: 50.w,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Already Have an account?",
                              style:
                                  isDark
                                      ? TextStyles.font16White700Weight
                                      : TextStyles.font16Black300Weight,
                            ),
                            CustomTextButton(
                              text: "Login",
                              onpressed: () {
                                MagicRouter.namedNavigation(Routes.loginPage);
                              },
                              fontWeight: FontWeight.w700,
                              fontsize: 17,
                              color: ColorsManager.mainblue,
                              textDecoration: TextDecoration.none,
                            ),
                          ],
                        ),
                        CustomTextFormFeild(
                          colorText:
                              isDark ? Colors.white : ColorsManager.black,
                          prefixIcon: SvgPicture.asset(
                            "assets/svgs/user_icon.svg",
                          ),
                          hint: "Name",
                          upperText: "Name",
                          controller: controller.nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "Gender",
                          style:
                              isDark
                                  ? TextStyles.font16White700Weight
                                  : TextStyles.font14Secondblack400Weight,
                        ),
                        SizedBox(height: 10.h),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.sp),
                          ),
                          child: DropdownButton<String>(
                            dropdownColor: isDark ? Colors.white : Colors.white,
                            style:
                                isDark
                                    ? TextStyles.font16Black300Weight
                                    : TextStyles.font16Black300Weight,
                            value:
                                controller.gender.isNotEmpty
                                    ? controller.gender
                                    : null,
                            underline: SizedBox(),
                            hint: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Text(
                                "gender",

                                style: TextStyle(
                                  color:
                                      isDark
                                          ? ColorsManager.black
                                          : ColorsManager.black,
                                ),
                              ),
                            ),

                            items:
                                _dropDownItems.map((String item) {
                                  return DropdownMenuItem(
                                    value: item,
                                    child: Text(item),
                                  );
                                }).toList(),

                            onChanged: (String? value) {
                              controller.gender = value ?? '';
                              _selectedItem = value;
                              controller.selectDropDownItem();
                            },
                          ),
                        ),
                        CustomTextFormFeild(
                          colorText:
                              isDark ? Colors.white : ColorsManager.black,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }

                            final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                            if (!emailRegExp.hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                          controller: controller.emailController,
                          upperText: "Email Address",
                          prefixIcon: SvgPicture.asset(
                            "assets/svgs/email_icon.svg",
                          ),
                          hint: "Email Address",
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
                          decoration: InputDecoration(
                            fillColor: ColorsManager.lightgrey,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.transparent),
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
                          validator: (value) {
                            if (value == null) {
                              return 'Please enter your phone number';
                            }
                          },
                          initialCountryCode: 'EG',
                          onChanged: (phone) {
                            controller.phoneCode = phone.countryCode;
                            print("Country Code: ${phone.countryCode}");
                            print("Phone Number: ${phone.number}");
                          },
                        ),

                        CustomTextFormFeild(
                          colorText:
                              isDark ? Colors.white : ColorsManager.black,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            }
                            if (value.length < 9) {
                              return 'Password must be at least 9 characters long';
                            }

                            // final passwordRegExp = RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*])');
                            // if (!passwordRegExp.hasMatch(value)) {
                            //   return 'Password must contain at least one uppercase letter, one digit, and one special character';
                            // }
                            return null;
                          },
                          prefixIcon: SvgPicture.asset(
                            "assets/svgs/password_icon.svg",
                          ),
                          hint: "Password",
                          controller: controller.passwordController,
                          secure: !controller.isPasswordShownFirst,
                          suffixIcon: IconButton(
                            onPressed: controller.onPassShowClickedFirst,
                            icon: Icon(
                              controller.isPasswordShownFirst
                                  ? AppIcons.eye
                                  : AppIcons.eyeNonVisible,
                              size: 24,
                            ),
                          ),
                          upperText: "Password",
                        ),
                        CustomTextFormFeild(
                          colorText:
                              isDark ? Colors.white : ColorsManager.black,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            }
                            if (value != controller.passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                          prefixIcon: SvgPicture.asset(
                            "assets/svgs/password_icon.svg",
                          ),
                          hint: "Password Confirmation",
                          secure: !controller.isPasswordShownSecond,
                          suffixIcon: IconButton(
                            onPressed: controller.onPassShowClickedSecond,
                            icon: Icon(
                              controller.isPasswordShownSecond
                                  ? AppIcons.eye
                                  : AppIcons.eyeNonVisible,
                              size: 24,
                            ),
                          ),
                          upperText: "Password Confirmation",
                          controller: controller.passwordConfirmationController,
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: controller.isChecked,
                              onChanged: (value) => controller.toggleCheckbox(),
                              activeColor: ColorsManager.mainblue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  50,
                                ), // Rounded checkbox
                              ),
                            ),
                            Text(
                              "I agree to",
                              style:
                                  isDark
                                      ? TextStyles.font16White700Weight
                                      : TextStyles.font14blackWei400ght,
                            ),
                            Text(
                              " Terms & Condition",
                              style: TextStyles.font14Mainblue700Weight,
                            ),
                          ],
                        ),
                        state is LoadingRegister
                            ? const SpinKitThreeBounce(
                              color: ColorsManager.mainblue,
                              size: 26.0,
                            )
                            : CustomButton(
                              child: Text(
                                "Confirm",
                                style: TextStyles.font16White700Weight,
                              ),
                              onPressed: () {
                                controller.signUp();
                              },
                            ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
