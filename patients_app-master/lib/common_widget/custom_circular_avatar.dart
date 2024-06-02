// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCircularAvatar extends StatelessWidget {
  final Function()? onTap;
  final Color borderColors;
  final Widget image;
  const CustomCircularAvatar({
    super.key,
    this.onTap,
    required this.borderColors,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 35.w,
        width: 35.w,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: borderColors),
        ),
        child: Center(child: image),
      ),
    );
  }
}
