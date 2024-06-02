import 'dart:async';

import 'package:flutter/material.dart';
import 'package:patients/common_widget/custom_image_view.dart';
import 'package:patients/core/style/color/colors.dart';
import 'package:patients/presentations/auth/sign_in.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    const splashDuration = Duration(seconds: 3);
    Timer(splashDuration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const SignInScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomOnboarding(
        widget: CustomImageView(
          svgPath: "assets/images/title.svg",
        ),
      ),
    );
  }
}

class CustomOnboarding extends StatelessWidget {
  final Widget widget;
  const CustomOnboarding({
    super.key,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: kSplashColor,
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: CustomImageView(
            svgPath: "assets/images/top_left.svg",
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: CustomImageView(
            svgPath: "assets/images/bottom_right.svg",
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: widget,
        )
      ],
    );
  }
}
