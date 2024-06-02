import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patients/common_widget/custom_card.dart';
import 'package:patients/common_widget/custom_circular_avatar.dart';
import 'package:patients/common_widget/custom_image_view.dart';
import 'package:patients/core/style/color/colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:patients/presentations/vitals_tracker/vitals_tracker.dart';

class TemperatureAnalysis extends StatefulWidget {
  const TemperatureAnalysis({super.key});

  @override
  State<TemperatureAnalysis> createState() => _TemperatureAnalysisState();
}

class _TemperatureAnalysisState extends State<TemperatureAnalysis> {
  bool _showOverlay = false;

  bool get showOverlay => _showOverlay;

  void toggleOverlay() {
    setState(() {
      _showOverlay = !_showOverlay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomCircularAvatar(
                      borderColors: Colors.black,
                      image: CustomImageView(
                        height: 30,
                        width: 30,
                        svgPath: 'assets/icons/PROFILE_UI.svg',
                      ),
                    ),
                    const Spacer(),
                    CustomCircularAvatar(
                      borderColors: kPrimary,
                      image: CustomImageView(
                        height: 30,
                        width: 25,
                        svgPath: 'assets/icons/cart.svg',
                      ),
                    ),
                    SizedBox(width: 10.w),
                    CustomCircularAvatar(
                      borderColors: kPrimary,
                      image: CustomImageView(
                        height: 30,
                        width: 30,
                        svgPath: 'assets/icons/mic.svg',
                      ),
                    ),
                    SizedBox(width: 10.w),
                    CustomCircularAvatar(
                      borderColors: kPrimary,
                      image: CustomImageView(
                        height: 30,
                        width: 30,
                        svgPath: 'assets/icons/notification-bing.svg',
                      ),
                    )
                  ],
                ),
                Gap(20.h),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(20.h),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>const VitalsTracker()));
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: kblue),
                                  borderRadius: BorderRadius.circular(20)),
                              child: const CircleAvatar(
                                backgroundColor: Colors.transparent,
                                child: Icon(
                                  Icons.arrow_back,
                                  color: kblue,
                                ),
                              )),
                        ),
                        Gap(20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AutoSizeText(
                              'Vitals tracker',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18.sp),
                              maxLines:
                                  1, // Add this to limit the text to one line
                            ),
                            const Gap(70),
                            Expanded(
                              child: Container(
                                height: 25.h,
                                width: 101.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: kblue),
                                child: Center(
                                  child: AutoSizeText(
                                    'Update vitals',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10.sp,
                                        color: kWhite),
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
                                    color: const Color(0xFF85D8FF)),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 29.h,
                                        width: 145.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: kblue),
                                        child: Center(
                                            child: AutoSizeText(
                                          "Data tracker",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10.sp,
                                              color: kWhite),
                                          maxLines: 1,
                                        )),
                                      ),
                                      Container(
                                        height: 29.h,
                                        width: 145.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                            child: AutoSizeText(
                                          "Analytics alerts",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10.sp,
                                              color: kWhite),
                                          maxLines: 1,
                                        )),
                                      )
                                    ])),
                            Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: kblue),
                                    borderRadius: BorderRadius.circular(20)),
                                child: CustomCircularAvatar(
                                    borderColors: kPrimary,
                                    image: CustomImageView(
                                      height: 30,
                                      width: 30,
                                      svgPath: 'assets/icons/sort.svg',
                                    )))
                          ],
                        ),
                        Gap(20.h),
                        AutoSizeText(
                          'Filter analytics',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18.sp),
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
                                      "Jan 2022 - Dec 2022 ",
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
                                    border: Border.all()),
                                child: Center(
                                    child: AutoSizeText(
                                  '1M',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.sp),
                                  maxLines: 1,
                                ))),
                                const Gap(3),
                            Container(
                                height: 28.h,
                                width: 37.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    border: Border.all()),
                                child: Center(
                                    child: AutoSizeText(
                                  '3M',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.sp),
                                  maxLines: 1,
                                ))),
                                const Gap(3),
                            Container(
                                height: 28.h,
                                width: 37.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    border: Border.all()),
                                child: Center(
                                    child: AutoSizeText(
                                  '6M',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.sp),
                                  maxLines: 1,
                                ))),
                                const Gap(3),
                            Container(
                                height: 28.h,
                                width: 37.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    border: Border.all()),
                                child: Center(
                                    child: AutoSizeText(
                                  '1Y',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.sp),
                                  maxLines: 1,
                                )))
                          ],
                        ),
                        Gap(20.h),
                        const Center(
                          child: CustomCard1(
                            iconSvgPath: "assets/images/temperature.svg",
                            waveSvgPath: "assets/images/tempwave.svg",
                            title: 'Temperature',
                            reading: '+3%',
                            tempreading: '31C',
                            cardGradient: kTemperature,
                            cardColor: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
         
        ]),
      ),
    );
  }

}