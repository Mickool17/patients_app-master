import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patients/common_widget/custom_image_view.dart';
import 'package:patients/common_widget/top_row.dart';
import 'package:patients/core/style/color/colors.dart';

class Inventory extends StatefulWidget {
  const Inventory({super.key});

  @override
  State<Inventory> createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
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
                    'Inventory details',
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
                      'assets/images/demo.png',
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
                        height: 352.h,
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
                                    "Paracetamol",
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "500mg",
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                              const Gap(20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "₦",
                                    style: TextStyle(
                                      fontSize: 28.sp,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          const Color.fromRGBO(42, 51, 56, 0.5),
                                    ),
                                  ),
                                  Text(
                                    "10,000.00",
                                    style: TextStyle(
                                      fontSize: 28.sp,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          const Color.fromRGBO(42, 51, 56, 0.5),
                                    ),
                                  ),
                                ],
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
                                    "Buy medication",
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w600,
                                      color: kWhite,
                                    ),
                                  ),
                                ),
                              ),
                              const Gap(20),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Composition details",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                          color: headlinecolor,
                                        ),
                                      ),
                                      const Gap(10),
                                      ...List.generate(
                                        5,
                                        (index) {
                                          String medication =
                                              medications[index];
                                          List<String> parts =
                                              medication.split(" ");
                                          String strength =
                                              parts[parts.length - 1];
                                          String name = medication.replaceAll(
                                              " $strength", "");

                                          return Row(
                                            children: [
                                              Text(
                                                name,
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: lightblack,
                                                ),
                                              ),
                                              const SizedBox(width: 4),
                                              _buildDot(),
                                              const SizedBox(width: 4),
                                              Text(
                                                strength,
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: lightblack,
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
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
                              Color.fromRGBO(201, 201, 201, 0.8),
                              Color.fromRGBO(196, 196, 196, 0.1),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        height: 352.h,
                        width: 343.w,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              const Gap(20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Manufacturing details",
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              const Gap(20),
                              const Gap(20),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Anigo Pharmaceuticals",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: headlinecolor,
                                      ),
                                    ),
                                    const Gap(10),
                                    ...List.generate(
                                      batchNumbers.length,
                                      (index) => Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            batchNumbers[index].keys.first,
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600,
                                              color: lightblack,
                                            ),
                                          ),
                                          Text(
                                            batchNumbers[index].values.first,
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600,
                                              color: lightblack,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Gap(
                                      20,
                                    ),
                                    Text(
                                      "Storage details",
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const Gap(20),
                                    Text(
                                      "Store in a cool dry place",
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                          color: lightblack),
                                    ),
                                  ],
                                ),
                              ),
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
                        height: 176.h,
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
                                    "Pharmacy details",
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
                                  children: [
                                    Text(
                                      "Amana Pharmacy Ltd",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: headlinecolor,
                                      ),
                                    ),
                                    
                                    Text(
                                      "Free delivery",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                          color: lightblack),
                                    ),
                                    const Gap(20),
                                    Text(
                                      "Ikotun      Lagos   ",
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                          color: lightblack),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Gap(30),
                      Align(
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
                      const Gap(20),
                      SizedBox(
                        width: 359,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
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

List<Map<String, String>> batchNumbers = [
  {"Batch number": "1836537353", "Value": "100"},
  {"Year of manufacturer": "2023", "Value": "200"},
  {"Expiry date": "2026", "Value": "300"},
  {"Rio De Janiero  Brazil   ": "", "Value": "400"},
];

List<String> medications = [
  "Paracetamol BP 100mg",
  "Caffeine 100mg",
  "Acetylene extract 100mg",
  "Propylene BP 100mg",
  "Paracetamol BP 100mg",
];
Widget _buildDot() {
  return Container(
    width: 5,
    height: 5,
    decoration: const BoxDecoration(
      color: kBlack,
      shape: BoxShape.circle,
    ),
  );
}
