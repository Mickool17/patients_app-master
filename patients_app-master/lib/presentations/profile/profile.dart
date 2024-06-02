import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patients/common_widget/custom_card.dart';
import 'package:patients/common_widget/top_row.dart';
import 'package:patients/core/style/color/colors.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTopRow(),
          const Gap(20),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Gap(20),
                  const CustomCard3(
                    color: Color.fromARGB(255, 233, 87, 136),
                    gradient: kTemperature,
                    title: "Account settings",
                    name: "Email, password, personal information,",
                    widget: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "content language and others.",
                          style: TextStyle(color: Colors.white),
                        ),
                        Gap(15),
                      ],
                    ),
                  ),
                  const Gap(20),
                  const CustomCard3(
                    color: kPrimary,
                    title: "Providers settings",
                    name: "Pharmacies, labs, hospitals and HMO,",
                    widget: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "settings..",
                          style: TextStyle(color: Colors.white),
                        ),
                        Gap(15),
                      ],
                    ),
                  ),
                  const Gap(20),
                  const CustomCard3(
                      title: "Notifications settings",
                      name: 'Alerts, recommendations, events, and',
                      widget: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Purchase reminder",
                            style: TextStyle(color: Colors.white),
                          ),
                          Gap(15),
                        ],
                      ),
                      color: kGreenColor),
                  const Gap(20),
                  Container(
                    width: 327.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: Text(
                        "Log Out",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
