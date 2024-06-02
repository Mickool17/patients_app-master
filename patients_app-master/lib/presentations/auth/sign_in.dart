import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patients/common_widget/custom_bottom.dart';
import 'package:patients/common_widget/custom_image_view.dart';
import 'package:patients/common_widget/custom_textfield.dart';
import 'package:patients/core/style/color/colors.dart';
import 'package:patients/presentations/dashboard/2dashboard.dart';
import 'package:patients/presentations/dashboard/dashboard.dart';
import 'package:patients/presentations/onboarding/splash_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomOnboarding(
        widget: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              const Text(
                "Welcome Back",
                style: TextStyle(
                  color: kWhite,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              const Gap(15),
              RoundTextField(
                isHintColor: false,
                hitText: 'Email Address or Patient ID',
                icon: CustomImageView(svgPath: "assets/icons/email.svg"),
              ),
              Gap(20.h),
              RoundTextField(
                isHintColor: false,
                hitText: 'Password',
                icon: CustomImageView(svgPath: "assets/icons/lock.svg"),
                rigtIcon: const Icon(
                  Icons.visibility,
                  color: kWhite,
                ),
              ),
              Gap(30.h),
              const Row(
                children: [
                  Spacer(),
                  Text(
                    "Forget Password?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Gap(30.h),
              ButtonWidget(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const   Dashboard(),
                    ),
                  );
                },
                title: "Login",
                color: kWhite,
              ),
              const Gap(22),
              SizedBox(
                width: 295.w,
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        indent: 55.w,
                        height: 2.h,
                        thickness: 1,
                        color: kWhite,
                      ),
                    ),
                    const Text(
                      "  Or Login with  ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: kWhite,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        endIndent: 55.w,
                        height: 2.h,
                        thickness: 1,
                        color: kWhite,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoginOption(
                    onTap: () {},
                    widget: CustomImageView(
                      svgPath: 'assets/images/google.svg',
                    ),
                  ),
                  Gap(30.w),
                  LoginOption(
                    onTap: () {},
                    widget: CustomImageView(
                      svgPath: 'assets/images/fb.svg',
                    ),
                  ),
                ],
              ),
              Gap.expand(100.h),
              const Text(
                "Dont's have an account? Sign Up",
                style: TextStyle(
                  color: kWhite,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 20)),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginOption extends StatelessWidget {
  final Widget widget;
  final Function() onTap;
  const LoginOption({
    super.key,
    required this.widget,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 70.h,
        width: 70.h,
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: kgrey),
        ),
        child: widget,
      ),
    );
  }
}
