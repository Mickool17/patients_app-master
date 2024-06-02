import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patients/common_widget/custom_image_view.dart';
import 'package:patients/common_widget/top_row.dart';
import 'package:patients/core/style/color/colors.dart';
import 'package:patients/presentations/search_results/laboratory.dart';

class Investigastordetails extends StatefulWidget {
  const Investigastordetails({super.key});

  @override
  State<Investigastordetails> createState() => _InvestigastordetailsState();
}

class _InvestigastordetailsState extends State<Investigastordetails> {
  @override
  bool isChecked = false;

  void onCheckboxTapped(int index) {
    setState(() {
      checkboxValues[index] = !checkboxValues[index];
    });
  }

  void onCheckboxTapped2() {
    setState(() {
      isChecked = !isChecked;
    });
  }

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
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const LaboratorySearch()));
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
              ),
              const Gap(20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Investigator details',
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
                                    "Braxi Diagnostics",
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
                                  "Western Avenue Expressway,\nLagos , Nigeria",
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
                        width: 343.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                              child: Text(
                                "Select test bundle",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            CustomExpansionTile(
                              title:
                                  'Choose what test that you need to carry out',
                              children: List.generate(
                                checkboxItems.length,
                                (index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    child: Column(children: [
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () =>
                                                onCheckboxTapped(index),
                                            child: Container(
                                              width: 20.w,
                                              height: 20.h,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  width: 2,
                                                  color: checkboxValues[index]
                                                      ? kblue
                                                      : Colors.grey,
                                                ),
                                                color: checkboxValues[index]
                                                    ? kblue
                                                    : Colors.transparent,
                                              ),
                                              child: Center(
                                                child: checkboxValues[index]
                                                    ? Container(
                                                        width: 8.w,
                                                        height: 8.h,
                                                        decoration:
                                                            const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: kWhite,
                                                        ),
                                                      )
                                                    : null,
                                              ),
                                            ),
                                          ),
                                          const Gap(10),
                                          Text(
                                            checkboxItems[index],
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600,
                                              color: lightblack,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Gap(5),
                                    ]),
                                  );
                                },
                              ),
                            ),
                          ],
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
                        height: 101.h,
                        width: 343.w,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Sample collection",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Gap(10),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: onCheckboxTapped2,
                                    child: Container(
                                      width: 20.w,
                                      height: 20.h,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 2,
                                          color:
                                              isChecked ? kblue : Colors.grey,
                                        ),
                                        color: isChecked ? kblue : Colors.grey,
                                      ),
                                      child: Center(
                                          child: isChecked
                                              ? Container(
                                                  width: 8.w,
                                                  height: 8.h,
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: kWhite,
                                                  ),
                                                )
                                              : Container(
                                                  width: 8.w,
                                                  height: 8.h,
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: kWhite,
                                                  ),
                                                )),
                                    ),
                                  ),
                                  const Gap(10),
                                  Text(
                                    "Delivery",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                      color: lightblack,
                                    ),
                                  ),
                                ],
                              ),
                              const Gap(10),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: onCheckboxTapped2,
                                    child: Container(
                                      width: 20.w,
                                      height: 20.h,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 2,
                                          color:
                                              isChecked ? kblue : Colors.grey,
                                        ),
                                        color: isChecked ? kblue : Colors.grey,
                                      ),
                                      child: Center(
                                          child: isChecked
                                              ? Container(
                                                  width: 8.w,
                                                  height: 8.h,
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: kWhite,
                                                  ),
                                                )
                                              : Container(
                                                  width: 8.w,
                                                  height: 8.h,
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: kWhite,
                                                  ),
                                                )),
                                    ),
                                  ),
                                  const Gap(10),
                                  Text(
                                    "In person",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                      color: lightblack,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      const Gap(20),
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
List<String> checkboxItems = [
  "Full Blood Count",
  "Hormones test",
  "X-ray scan",
  "Sperm count test",
];

List<bool> checkboxValues = List.filled(checkboxItems.length, false);
Widget customArrowWidget(bool isExpanded) {
  return Container(
    height: 33.h,
    width: 33.w,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(20),
    ),
    child: CircleAvatar(
      backgroundColor: Colors.white,
      child: Icon(
        isExpanded ? Icons.arrow_upward : Icons.arrow_downward,
        color: Colors.grey,
      ),
    ),
  );
}

class CustomExpansionTile extends StatefulWidget {
  final String title;
  final List<Widget> children;

  const CustomExpansionTile({super.key, required this.title, required this.children});

  @override
  // ignore: library_private_types_in_public_api
  _CustomExpansionTileState createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool isExpanded = false;

  void onToggle() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: AutoSizeText(widget.title,maxLines: 1,style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w600),),
          trailing: GestureDetector(
            onTap: onToggle,
            child: Container(
              height: 33.h,
              width: 33.w,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20),
              ),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  isExpanded ? Icons.arrow_upward : Icons.arrow_downward,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
        if (isExpanded)
          Column(
            children: widget.children,
          ),
      ],
    );
  }
}
