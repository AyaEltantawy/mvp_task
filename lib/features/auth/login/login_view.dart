import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvp_project/core/routing/page_router.dart';
import '../../../core/constants/app_icons.dart';
import '../../../core/routing/routes.dart';
import '../../../core/shared_widgets/custom_button.dart';
import '../../../core/shared_widgets/custom_text_button.dart';
import '../../../core/shared_widgets/custom_text_form_feild.dart';
import '../../../core/theming/colors.dart';
import '../../../core/theming/styles.dart';
import 'login_cubit.dart';
import 'login_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              final controller = BlocProvider.of<LoginCubit>(context);
              //controller.fetchUserData();
              return Form(
                key: controller.formKey,
                child: ListView(
                  padding: EdgeInsets.only(
                    right: 20.w,
                    left: 20.w,
                    top: 20.h,
                    bottom: 20.h,
                  ),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Login", style: TextStyles.font30Black700Weight),
                        Image.asset(
                          "assets/images/success-logo-design-template-vector.jpg",
                          width: 50.w,
                          height: 50.w,
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Text(
                          "Don’t Have an account?",
                          style: TextStyles.font16Black300Weight,
                        ),
                        CustomTextButton(
                          text: "Create New Account",
                          onpressed: () {
                            MagicRouter.namedNavigation(Routes.register);
                          },
                          fontWeight: FontWeight.w700,
                          fontsize: 14,
                          color: ColorsManager.mainblue,
                          textDecoration: TextDecoration.none,
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    CustomTextFormFeild(
                      prefixIcon: SvgPicture.asset(
                        "assets/svgs/email_icon.svg",
                      ),
                      hint: "Email Address",
                      upperText: "Email Address",
                      controller: controller.emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }

                        if (!RegExp(
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                        ).hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    CustomTextFormFeild(
                      prefixIcon: SvgPicture.asset(
                        "assets/svgs/password_icon.svg",
                      ),
                      hint: "Password",

                      controller: controller.passwordController,
                      secure: !controller.isPasswordShown,

                      suffixIcon: IconButton(
                        onPressed: controller.onPassShowClicked,
                        icon: Icon(
                          controller.isPasswordShown
                              ? AppIcons.eye
                              : AppIcons.eyeNonVisible,
                          size: 24,
                        ),
                      ),
                      upperText: "Password",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 8) {
                          return 'Password must be at least 9 characters';
                        }
                        return null;
                      },
                    ),
                    CustomTextButton(
                      text: "Forget Password ?",
                      alignment: Alignment.centerRight,
                      onpressed: () {},
                    ),
                    state is LoadingLogin
                        ? const SpinKitThreeBounce(
                          color: ColorsManager.mainblue,
                          size: 26.0,
                        )
                        : CustomButton(
                          onPressed: () {
                            controller.login();
                          },
                          child: Text(
                            'Login',
                            style: TextStyles.font16White700Weight,
                          ),
                        ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: ColorsManager.linegrey,
                            thickness: 1,
                          ),
                        ),
                        // Text in the middle
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            'Or',
                            style: TextStyles.font12Seconderyblue400Weight,
                          ),
                        ),
                        // Right Divider
                        const Expanded(
                          child: Divider(
                            color: ColorsManager.linegrey,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      width: 325.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          width: 1,
                          color: ColorsManager.bordergrey,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/svgs/google_logo.svg"),
                          SizedBox(width: 10.w),
                          Text(
                            "Continue With Google",
                            style: TextStyles.font14blackWei400ght,
                          ),
                        ],
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
