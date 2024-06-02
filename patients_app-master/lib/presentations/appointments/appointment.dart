import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patients/common_widget/top_row.dart';
import 'package:patients/presentations/appointments/sub_appointment.dart';
import 'package:patients/presentations/dashboard/dashboard.dart';
import 'package:patients/presentations/home/home_screen.dart';

import '../../common_widget/custom_card.dart';
import '../../common_widget/custom_circular_avatar.dart';
import '../../common_widget/custom_image_view.dart';
import '../../core/style/color/colors.dart';

class Appointments extends StatefulWidget {
  const Appointments({super.key});

  @override
  State<Appointments> createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                        GestureDetector(
                          onTap: () => _onButtonTapped(0),
                          child: Container(
                            height: 29.h,
                            width: 145.w, // Keep the original width
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: _activeButtonIndex == 0
                                  ? kblue
                                  : Colors.transparent,
                            ),
                            child: Center(
                              child: FittedBox(
                                // Wrap AutoSizeText with FittedBox
                                fit: BoxFit.scaleDown,
                                child: AutoSizeText(
                                  " Upcoming appointments ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10
                                        .sp, // You can set a larger initial font size
                                    color: _activeButtonIndex == 0
                                        ? kWhite
                                        : kblue,
                                  ),
                                  maxLines: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => _onButtonTapped(1),
                          child: Container(
                            height: 29.h,
                            width: 145.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: _activeButtonIndex == 1
                                  ? kblue
                                  : Colors.transparent,
                            ),
                            child: Center(
                              child: AutoSizeText(
                                "Past appointments",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10.sp,
                                  color:
                                      _activeButtonIndex == 1 ? kWhite : kblue,
                                ),
                                maxLines: 1,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Gap(10.w),
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
              Expanded(
                child: Center(
                  child: _activeButtonIndex == 0
                      ? SingleChildScrollView(
                          child: Column(
                            children: [
                              GestureDetector(child: buildAppointmentCard(),
                              onTap: () {
                                  Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const SubAppointment(),
          ),
        );
                              },),
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
      name: "Igbobi General Hospital - In person",
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
        Text("Dr. Hassan Ajikobi", style: appointmentDetailsTextStyle),
        Gap(15.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomImageView(imagePath: "assets/icons/calendar.png"),
            Expanded(
              child: Row(
                children: [
                  AutoSizeText(
                    "Fri Dec 22 * 10:00am - 12:00pm",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: appointmentDetailsTextStyle,
                  ),
                  Spacer(),
                  const CircleAvatar(
                    backgroundColor: kWhite,
                    child: Icon(Icons.arrow_forward,color: kPrimary,),
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
