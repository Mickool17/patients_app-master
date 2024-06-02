import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patients/common_widget/custom_card.dart';
import 'package:patients/common_widget/custom_image_view.dart';
import 'package:patients/common_widget/top_row.dart';
import 'package:patients/core/style/color/colors.dart';
import 'package:patients/presentations/dashboard/dashboard.dart';
import 'package:patients/presentations/wallet/wallet.dart';

import '../../inventory/investigatordetails.dart';

class WalletPage2 extends StatefulWidget {
  const WalletPage2({super.key});

  @override
  State<WalletPage2> createState() => _WalletPage2State();
}

class _WalletPage2State extends State<WalletPage2> {
  int selectedIndex = 0;

  void onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

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

  bool isPharmacyManagerChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
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
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const Dashboard()));
                            },
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                border: Border.all(color: kblue),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.transparent,
                                child: Icon(
                                  Icons.arrow_back,
                                  color: kblue,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Gap(20),
                      CustomCard3(
                        gradient: kTemperature,
                        color: Colors.black,
                        title: 'Account balance',
                        widget: Column(
                          children: [
                            Text(
                              "₦20,000",
                              style: TextStyle(
                                  fontSize: 28.sp,
                                  fontWeight: FontWeight.w600,
                                  color: kWhite),
                            ),
                          ],
                        ),
                      ),
                      const Gap(50),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildActionButton(
                                "Send money", "assets/icons/List.svg", 0),
                            buildActionButton(
                                "Add money", "assets/icons/Add.svg", 1),
                          ],
                        ),
                      ),
                      const Gap(20),
                      if (selectedIndex == 0) buildSendMoneyView(),
                      if (selectedIndex == 1) buildAddMoneyView(),
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

  Widget buildActionButton(String text, String svgPath, int index) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Row(
        children: [
          if (selectedIndex == index)
            Container(
              height: 49.h,
              width: 171.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: kPrimary,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    svgPath: svgPath,
                    color: kWhite,
                  ),
                  const Gap(10),
                  Text(
                    text,
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: kWhite),
                  ),
                ],
              ),
            )
          else
            Row(
              children: [
                CustomImageView(
                  svgPath: svgPath,
                  color: kPrimary,
                ),
                const Gap(10),
                Text(
                  text,
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: kPrimary),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget buildSendMoneyView() {
    return Container(
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
      height: 380.h,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Receiver type",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Gap(10),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isPharmacyManagerChecked = true;
                      });
                    },
                    child: Container(
                      width: 20.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 2,
                          color: isPharmacyManagerChecked ? kblue : Colors.grey,
                        ),
                        color: isPharmacyManagerChecked
                            ? kblue
                            : Colors.transparent,
                      ),
                      child: Center(
                        child: isPharmacyManagerChecked
                            ? Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 16.sp,
                              )
                            : null,
                      ),
                    ),
                  ),
                  const Gap(10),
                  Text(
                    "Pharmacy Manager",
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
                    onTap: () {
                      setState(() {
                        isPharmacyManagerChecked = false;
                      });
                    },
                    child: Container(
                      width: 20.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 2,
                          color: isPharmacyManagerChecked ? Colors.grey : kblue,
                        ),
                        color: isPharmacyManagerChecked
                            ? Colors.transparent
                            : kblue,
                      ),
                      child: Center(
                        child: !isPharmacyManagerChecked
                            ? Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 16.sp,
                              )
                            : null,
                      ),
                    ),
                  ),
                  const Gap(10),
                  Text(
                    "Others",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: lightblack,
                    ),
                  ),
                ],
              ),
              const Gap(20),
              if (!isPharmacyManagerChecked) ...[
                Text(
                  "Account Number",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Gap(10),
                Container(
                  width: 305.w,
                  height: 49.h,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(42, 51, 56, 0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixText: '₦ ',
                      prefixStyle: const TextStyle(color: Colors.white),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(16),
                      hintText: 'Enter Account Number',
                      hintStyle:
                          TextStyle(color: Colors.white70, fontSize: 11.sp),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const Gap(20),
                Text(
                  "Bank Name",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Gap(10),
                Container(
                  width: 305.w,
                  height: 49.h,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(42, 51, 56, 0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(16),
                      hintText: 'Enter Bank Name',
                      hintStyle:
                          TextStyle(color: Colors.white70, fontSize: 11.sp),
                    ),
                  ),
                ),
                const Gap(20),
                Text(
                  "Amount",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Gap(10),
                Container(
                  width: 305.w,
                  height: 49.h,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(42, 51, 56, 0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(16),
                      hintText: 'Enter Bank Name',
                      hintStyle:
                          TextStyle(color: Colors.white70, fontSize: 11.sp),
                    ),
                  ),
                ),
              ] else ...[
                Text(
                  "Provider ID",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Gap(10),
                Container(
                  width: 305.w,
                  height: 49.h,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(42, 51, 56, 0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(16),
                      hintText: 'Enter Provider ID',
                      hintStyle:
                          TextStyle(color: Colors.white70, fontSize: 11.sp),
                    ),
                  ),
                ),
                const Gap(20),
                Text(
                  "Amount",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Gap(10),
                Container(
                  width: 305.w,
                  height: 49.h,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(42, 51, 56, 0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(16),
                      hintText: 'Enter Bank Name',
                      hintStyle:
                          TextStyle(color: Colors.white70, fontSize: 11.sp),
                    ),
                  ),
                ),
              ],
              const Gap(20),
              Container(
                width: 327.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    'Confirm Details',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
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

Widget buildAddMoneyView() {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Account Number",
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Gap(10),
        Container(
          width: 305.w,
          height: 49.h,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(42, 51, 56, 0.5),
            borderRadius: BorderRadius.circular(16),
          ),
          child: TextField(
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              prefixText: '₦ ',
              prefixStyle: const TextStyle(color: Colors.white),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(16),
              hintText: 'Enter Account Number',
              hintStyle: TextStyle(color: Colors.white70, fontSize: 11.sp),
            ),
            keyboardType: TextInputType.number,
          ),
        ),
        const Gap(20),
        Text(
          "Bank Name",
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Gap(10),
        Container(
          width: 305.w,
          height: 49.h,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(42, 51, 56, 0.5),
            borderRadius: BorderRadius.circular(16),
          ),
          child: TextField(
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(16),
              hintText: 'Enter Bank Name',
              hintStyle: TextStyle(color: Colors.white70, fontSize: 11.sp),
            ),
          ),
        ),
        Gap(20),
        Text(
          "Amount",
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Gap(10),
        Container(
          width: 305.w,
          height: 49.h,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(42, 51, 56, 0.5),
            borderRadius: BorderRadius.circular(16),
          ),
          child: TextField(
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(16),
              hintText: 'Enter Bank Name',
              hintStyle: TextStyle(color: Colors.white70, fontSize: 11.sp),
            ),
          ),
        ),
        const Gap(20),
        Container(
          width: 327.w,
          height: 50.h,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              'Confirm Details',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ]),
    ),
  );
}
