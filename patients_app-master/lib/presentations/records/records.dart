

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patients/common_widget/custom_card.dart';
import 'package:patients/common_widget/custom_circular_avatar.dart';
import 'package:patients/common_widget/custom_image_view.dart';
import 'package:patients/common_widget/vitals_tracker_widget.dart';
import 'package:patients/core/style/color/colors.dart';
import 'package:patients/presentations/appointments/appointment.dart';
import 'package:patients/presentations/billing/billing.dart';
import 'package:patients/presentations/documents/document.dart';
import 'package:patients/presentations/purchases/purchases.dart';

class Records extends StatelessWidget {
  const Records({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
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
                  svgPath: 'assets/icons/mic.svg',
                ),
              ),
              const Spacer(),
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
          ),
          const Gap(20),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Records",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(20),
                  CustomCard(
                    title: 'Vitals tracker',
                    name: 'Temperature',
                    reading: '+3%',
                    cardGradient: kTemperature,
                    cardColor: kBlack,
                    list: Row(
                      children: [
                        CustomImageView(
                          height: 30.h,
                          svgPath: 'assets/images/temperature.svg',
                        ),
                        // const Spacer(),
                      ],
                    ),
                    tempReading: '31C',
                  ),
                  const Gap(20),
                  CustomCard2(
                    color: kPrimary,
                    title: "Appointment",
                    name: "Igbobi General Hospital - In person",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const Appointments()));
                    },
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Dr. Hassan Ajikobi",
                          style: TextStyle(color: Colors.white),
                        ),
                        const Gap(15),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CustomImageView(
                              imagePath: "assets/icons/calendar.png",
                            ),
                            const Expanded(
                              child: Text(
                                "Fri Dec 22 * 10:00am - 12:00pm",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Gap(20),
                  CustomCard2(
                      title: "Purchases",
                      name: 'Precription #1346789',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const Purchases()));
                      },
                      widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Purchase reminder",
                            style: TextStyle(color: Colors.white),
                          ),
                          const Gap(15),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CustomImageView(
                                imagePath: "assets/icons/calendar.png",
                              ),
                              const Text(
                                " Fri Dec 22",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                      color: kGreenColor),
                  const Gap(20),
                  CustomCard2(
                      title: "Documents",
                      name: 'Leg scan',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const Documents()));
                      },
                      widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Acumen Medical Centre",
                            style: TextStyle(color: Colors.white),
                          ),
                          const Gap(15),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CustomImageView(
                                imagePath: "assets/icons/calendar.png",
                              ),
                              const Text(
                                " Thu Jun 152",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                      color: kRedColor),
                  const Gap(20),
                  CustomCard2(
                      title: "Consultation notes",
                      name: 'Note #13456789',
                      widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Thu Jun 15",
                            style: TextStyle(color: Colors.white),
                          ),
                          const Gap(15),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CustomImageView(
                                imagePath: "assets/icons/calendar.png",
                              ),
                              const Text(
                                " Fri Dec 22",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                      color: kGreyColor),
                  const Gap(20),
                  CustomCard2(
                      title: "Billing",
                      name: 'Invoice #13456789',
                      onTap: () {
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const Billing()));
                      },
                      widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Acumen Medical Centre",
                            style: TextStyle(color: Colors.white),
                          ),
                          const Gap(15),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CustomImageView(
                                imagePath: "assets/icons/calendar.png",
                              ),
                              const Text(
                                " Thu Jun 15",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                      color: kWineColor)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
