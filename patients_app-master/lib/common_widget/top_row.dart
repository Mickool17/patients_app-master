  import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patients/common_widget/custom_circular_avatar.dart';
import 'package:patients/core/style/color/colors.dart';

import 'custom_image_view.dart';

Widget buildTopRow() {
    return Row(
      children: [
        CustomCircularAvatar(
          borderColors: Colors.black,
          image: CustomImageView(
            height: 30,
            width: 30,
            svgPath: 'assets/icons/Profile.svg',
          ),
        ),
        const Spacer(),
        CustomCircularAvatar(
          borderColors: kPrimary,
          image: CustomImageView(
            height: 30,
            width: 30,
            svgPath: 'assets/icons/cart.svg',
          ),
        ),
        const SizedBox(width: 10),
        CustomCircularAvatar(
          borderColors: kPrimary,
          image: CustomImageView(
            height: 30,
            width: 30,
            svgPath: 'assets/icons/mic.svg',
          ),
        ),
        const SizedBox(width: 10),
        CustomCircularAvatar(
          borderColors: kPrimary,
          image: CustomImageView(
            height: 30,
            width: 30,
            svgPath: 'assets/icons/notification-bing.svg',
          ),
        )
      ],
    );
  }



class FilterSAnaysisSubRow extends StatelessWidget {
  const FilterSAnaysisSubRow({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText(
              'Vitals tracker',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.sp),
              maxLines: 1,
            ),
            const Gap(70),
            Expanded(
              child: Container(
                height: 25.h,
                width: 101.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kblue,
                ),
                child: Center(
                  child: AutoSizeText(
                   'Update vitals',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 10.sp,
                      color: kWhite,
                    ),
                    maxLines: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
        Gap(20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 47.h,
              width: 306.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFF85D8FF),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 29.h,
                    width: 145.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: kblue,
                    ),
                    child: Center(
                      child: AutoSizeText(
                        "Data tracker",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 10.sp,
                          color: kWhite,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ),
                  Container(
                    height: 29.h,
                    width: 145.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: AutoSizeText(
                        "Analytics alerts",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 10.sp,
                          color: kWhite,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: kblue),
                borderRadius: BorderRadius.circular(20),
              ),
              child: CustomCircularAvatar(
                borderColors: kPrimary,
                image: CustomImageView(
                  height: 30,
                  width: 30,
                  svgPath: 'assets/icons/sort.svg',
                ),
              ),
            )
          ],
        ),
        Gap(20.h),
        AutoSizeText(
          'Filter analytics',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.sp),
          maxLines: 1,
        ),
        Gap(20.h),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 28.h,
                width: 180.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.calendar_month),
                    Expanded(
                      child: AutoSizeText(
                       'Jan 2022 - Dec 2022 ',
                        style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Gap(3),
            Container(
              height: 28.h,
              width: 37.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                border: Border.all(),
              ),
              child: Center(
                child: AutoSizeText(
                  '1M',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp),
                  maxLines: 1,
                ),
              ),
            ),
            const Gap(3),
            Container(
              height: 28.h,
              width: 37.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                border: Border.all(),
              ),
              child: Center(
                child: AutoSizeText(
                  '3M',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp),
                  maxLines: 1,
                ),
              ),
            ),
            const Gap(3),
            Container(
              height: 28.h,
              width: 37.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                border: Border.all(),
              ),
              child: Center(
                child: AutoSizeText(
                  '6M',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp),
                  maxLines: 1,
                ),
              ),
            ),
            const Gap(3),
            Container(
              height: 28.h,
              width: 37.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                border: Border.all(),
              ),
              child: Center(
                child: AutoSizeText(
                  '1Y',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp),
                  maxLines: 1,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
