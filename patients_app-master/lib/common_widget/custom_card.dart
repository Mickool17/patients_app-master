import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patients/common_widget/custom_image_view.dart';
import 'package:patients/core/style/color/colors.dart';


class CustomCard2 extends StatelessWidget {
  final Function()? onTap;
  final String title;
  final String? name;
  final Color color;
  final Widget widget;

  const CustomCard2({
    super.key,
    this.onTap,
    required this.title,
    this.name,
    required this.widget,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            InkWell(
              onTap: onTap,
              child: const Text(
                "see all",
                style: TextStyle(
                  color: kPrimary,
                  //fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        const Gap(10),
        Container(
          height: 140.w,
          padding: EdgeInsets.symmetric(
            horizontal: 27.h,
          ).copyWith(top: 15, bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: color,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: AutoSizeText(
                      name ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(10),
              widget,
            ],
          ),
        ),
      ],
    );
  }
}

class CustomCard1 extends StatelessWidget {
  final String title;
  final String reading;
  final String tempreading;
  final Color? cardColor;
  final Gradient? cardGradient;
  final String iconSvgPath;
  final String waveSvgPath;

  const CustomCard1({
    super.key,
    required this.title,
    required this.reading,
    required this.tempreading,
    this.cardColor,
    this.cardGradient,
    required this.iconSvgPath,
    required this.waveSvgPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 363.h,
      width: 348.w,
      padding: EdgeInsets.symmetric(horizontal: 10.h).copyWith(top: 15, bottom: 10),
      decoration: BoxDecoration(
        color: cardColor ?? Colors.transparent,
        gradient: cardGradient,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          const Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: kWhite),
              ),
              Text(
                reading,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: kWhite),
              ),
            ],
          ),
          const Gap(20),
          Text(
            tempreading,
            style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w600, color: kWhite),
          ),
          const Gap(10),
          Align(
            alignment: Alignment.topLeft,
            child: CustomImageView(
              height: 31.h,
              svgPath: iconSvgPath,
            ),
          ),
          Expanded(child: Container()),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomImageView(
              width: 332.w,
              svgPath: waveSvgPath,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCard3 extends StatelessWidget {
  final Function()? onTap;
  final String? title;
  final String? name;
  final Color? color;
  final Gradient? gradient;
  final Widget widget;

  const CustomCard3({
    super.key,
    this.onTap,
    this.title,
    this.name,
    this.color,
    this.gradient,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(
            title!,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        const Gap(10),
        Container(
          height: 140,
          padding: const EdgeInsets.symmetric(
            horizontal: 27,
          ).copyWith(top: 15, bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: color ?? Colors.transparent,
            gradient: gradient,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: AutoSizeText(
                      name ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(10),
              widget,
            ],
          ),
        ),
      ],
    );
  }
}
