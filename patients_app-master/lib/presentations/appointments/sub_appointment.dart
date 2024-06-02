import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patients/common_widget/top_row.dart';
import 'package:patients/presentations/appointments/appointment.dart';
import 'package:patients/presentations/dashboard/dashboard.dart';

import '../../common_widget/custom_card.dart';
import '../../common_widget/custom_circular_avatar.dart';
import '../../common_widget/custom_image_view.dart';
import '../../core/style/color/colors.dart';

class SubAppointment extends StatefulWidget {
  const SubAppointment({super.key});

  @override
  State<SubAppointment> createState() => _SubAppointmentState();
}

class _SubAppointmentState extends State<SubAppointment> {
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    'Appointments',
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
                    maxLines: 1,
                  ),
                  const Gap(60),
                  Expanded(
                    child: Container(
                      height: 25.h,
                      width: 140.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kblue,
                      ),
                      child: Center(
                        child: AutoSizeText(
                          'Schedule appointment',
                          textAlign: TextAlign.center,
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
              buildAppointmentCard(),
              Gap(20.h),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(27),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromRGBO(201, 201, 201, 0.8),
                      Color.fromRGBO(196, 196, 196, 0.1),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                height: 246.h,
                width: 343.w,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Igbobi General Hospital",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star_rate,
                                size: 10,
                                color: kYellowColor,
                              ),
                              Text(
                                "4.8",
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const Gap(20),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Western Avenue Expressway,\nLagos, Nigeria",
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: lightblack),
                        ),
                      ),
                      const Gap(20),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Schedule",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CustomImageView(
                                    imagePath: "assets/icons/calendar.png"),
                                Gap(4.w),
                                Text(
                                  "Fri Dec 22 10:00am - 12:00pm",
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                      color: lightblack),
                                ),
                              ],
                            ),
                             Gap(10.h),
                            Row(
                              children: [
                                CustomImageView(
                                    imagePath: "assets/icons/calendar.png"),
                                Gap(4.w),
                                Text(
                                  "Recurring",
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                      color: lightblack),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Gap(30.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Contact",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: headlinecolor,
                    ),
                  ),
                ),
              ),
              Gap(30.h),
              SizedBox(
                width: 359,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomImageView(
                        svgPath: 'assets/icons/call.svg',
                      ),
                      CustomImageView(
                        svgPath: 'assets/icons/sms.svg',
                      ),
                      CustomImageView(
                        svgPath: 'assets/icons/sms.svg',
                      )
                    ],
                  ),
                ),
              )
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
      name: "Chest pain complain",
      widget: buildAppointmentDetails(appointmentDetailsTextStyle),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const Appointments(),
          ),
        );
      },
    );
  }

  Widget buildAppointmentDetails(TextStyle appointmentDetailsTextStyle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Dr. Hassan Ajikobi", style: appointmentDetailsTextStyle),
        Gap(15.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: AutoSizeText(
                "Cardiologist",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: appointmentDetailsTextStyle,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
