// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patients/common_widget/custom_card.dart';
import 'package:patients/common_widget/top_row.dart';
import 'package:patients/core/style/color/colors.dart';
import 'package:patients/presentations/vitals_tracker/vitals_tracker.dart';

class BloodSugar extends StatefulWidget {
  const BloodSugar({super.key});

  @override
  State<BloodSugar> createState() => _BloodSugarState();
}

class _BloodSugarState extends State<BloodSugar> {
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
                buildTopRow(),
                Gap(20.h),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(20.h),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const VitalsTracker()));
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
                        const FilterSAnaysisSubRow(),
                        Gap(20.h),
                        const Center(
                          child: CustomCard1(
                            iconSvgPath: "assets/icons/bloodicon.svg",
                            waveSvgPath: "assets/images/bloodwave.svg",
                            title: 'Height',
                            reading: '-3%',
                            tempreading: '120mg/dL',
                            cardColor: kYellowColor,
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
