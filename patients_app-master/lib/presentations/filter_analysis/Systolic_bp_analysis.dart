// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patients/common_widget/custom_card.dart';
import 'package:patients/common_widget/top_row.dart';
import 'package:patients/core/style/color/colors.dart';
import 'package:patients/presentations/vitals_tracker/vitals_tracker.dart';

class SystolicBp extends StatefulWidget {
  const SystolicBp({super.key});

  @override
  State<SystolicBp> createState() => _SystolicBpState();
}

class _SystolicBpState extends State<SystolicBp> {
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
                            iconSvgPath: "assets/icons/bp.svg",
                            waveSvgPath: "assets/images/systolicwave.svg",
                            title: 'Systolic blood pressure',
                            reading: '+100%',
                            tempreading: '173mmHg',
                            cardColor: kblue,
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
