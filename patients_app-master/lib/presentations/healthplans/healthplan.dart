import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patients/common_widget/top_row.dart';
import 'package:patients/presentations/dashboard/dashboard.dart';
import 'package:patients/presentations/home/home_screen.dart';
import 'package:patients/presentations/purchases/subpurchases.dart';

import '../../common_widget/custom_card.dart';
import '../../common_widget/custom_image_view.dart';
import '../../core/style/color/colors.dart';

class HealthPlan extends StatefulWidget {
  const HealthPlan({super.key});

  @override
  State<HealthPlan> createState() => _HealthPlanState();
}

class _HealthPlanState extends State<HealthPlan> {
  int _activeButtonIndex = 0;

  void _onButtonTapped(int index) {
    setState(() {
      _activeButtonIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              buildTopRow(),
              Gap(20.h),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const Dashboard()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: kblue),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Icon(
                          Icons.arrow_back,
                          color: kblue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Gap(15.h),
              Expanded(
                child: Center(
                  child: _activeButtonIndex == 0
                      ? SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Health plans",
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Spacer(),
                                  Container(
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: kPrimary, width: 1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: CircleAvatar(
                                      radius: 15,
                                      backgroundColor: Colors.transparent,
                                      child: CustomImageView(
                                        svgPath: 'assets/icons/sort.svg',
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              GestureDetector(
                                child: buildAppointmentCard(),
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => const SubPurchases(),
                                    ),
                                  );
                                },
                              ),
                              buildAppointmentCard(),
                              buildAppointmentCard(),
                              buildAppointmentCard(),
                            ],
                          ),
                        )
                      : AutoSizeText(
                          'Past Content',
                          style: TextStyle(fontSize: 20.sp),
                          maxLines: 5,
                        ),
                ),
              ),
              Gap(50.h)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAppointmentCard() {
    const appointmentDetailsTextStyle = TextStyle(color: Colors.white);

    return CustomCard3(
      color: kPrimary,
      name: "Reliance Health HMO",
      widget: buildAppointmentDetails(appointmentDetailsTextStyle),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const HomePage(),
          ),
        );
      },
    );
  }

  Widget buildAppointmentDetails(TextStyle appointmentDetailsTextStyle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Active", style: appointmentDetailsTextStyle),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomImageView(imagePath: "assets/icons/calendar.png"),
            AutoSizeText(
              "Fri Dec 22 10:00am",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: appointmentDetailsTextStyle,
            ),
            const Expanded(
              child: Row(
                children: [
                  Spacer(),
                  CircleAvatar(
                    backgroundColor: kWhite,
                    child: Icon(
                      Icons.arrow_forward,
                      color: kPrimary,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
