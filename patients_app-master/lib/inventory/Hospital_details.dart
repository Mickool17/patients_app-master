import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patients/common_widget/custom_image_view.dart';
import 'package:patients/common_widget/top_row.dart';
import 'package:patients/core/style/color/colors.dart';

class Hospitaldetails extends StatefulWidget {
  const Hospitaldetails({super.key});

  @override
  State<Hospitaldetails> createState() => _HospitaldetailsState();
}

class _HospitaldetailsState extends State<Hospitaldetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildTopRow(),
              const Gap(20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Hospital details',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 28.sp,
                      color: headlinecolor,
                    ),
                  ),
                ),
              ),
              const Gap(10),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    height: 181.h,
                    width: 348.w,
                    child: Image.asset(
                      'assets/images/hospital.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const Gap(20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                child: Text(
                                  "Fri Dec 22 10:00am - 12:00pm",
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                      color: lightblack),
                                ),
                              ),
                              const Gap(20),
                              Container(
                                height: 28.h,
                                width: 203.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: kblue,
                                ),
                                child: Center(
                                  child: Text(
                                    "Book appointment",
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w600,
                                      color: kWhite,
                                    ),
                                  ),
                                ),
                              ),
                              const Gap(20),
                            ],
                          ),
                        ),
                      ),
                      const Gap(30),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(27),
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromRGBO(255, 255, 255, 0.8),
                              Color.fromRGBO(211, 211, 211, 0.1),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Specializations",
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              const Gap(20),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: List.generate(
                                    specialization.length,
                                    (index) => Column(
                                      children: [
                                        Text(
                                          specialization[index],
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w600,
                                            color: lightblack,
                                          ),
                                        ),
                                        const Gap(5),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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
                      const Gap(20),
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
            ],
          ),
        ),
      ),
    );
  }
}

List<String> specialization = [
  "Oncology",
  "Outpatient services",
  "Rehabilitation",
  "Geriatric",
  "Pediatric",
  "ENT",
];
