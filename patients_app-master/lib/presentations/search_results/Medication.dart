import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patients/common_widget/custom_circular_avatar.dart';
import 'package:patients/common_widget/custom_image_view.dart';
import 'package:patients/common_widget/top_row.dart';
import 'package:patients/core/style/color/colors.dart';
import 'package:patients/inventory/inventory.dart';
import 'package:patients/presentations/dashboard/dashboard.dart';

class MedicationSearch extends StatefulWidget {
  const MedicationSearch({super.key});

  @override
  State<MedicationSearch> createState() => _MedicationSearchState();
}

class _MedicationSearchState extends State<MedicationSearch> {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    setState(() {
      _counter++;
    });
  }

  void decrement() {
    setState(() {
      _counter--;
    });
  }

  Widget _buildPharmacyCard(String pharmacyName, String location) {
    return Container(
      height: 124.h,
      width: 348.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kblue,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  
                  pharmacyName,maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    color: kWhite,
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: decrement,
                      child: Container(
                        width: 30.7.w,
                        height: 19.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: kWhite),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.remove,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '$counter',
                      style: const TextStyle(color: kWhite),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: increment,
                      child: Container(
                        width: 30.7.w,
                        height: 19.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: kWhite),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            
            Row(
              children: [
                AutoSizeText(
                  "12.00 . Free delivery",maxLines: 1,
                  style: TextStyle(fontSize: 14.sp, color: kWhite),
                )
              ],
            ),
          
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  location,
                  style: TextStyle(fontSize: 14.sp, color: kWhite),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Inventory(),
                      ),
                    );
                  },
                  child: const CircleAvatar(
                    backgroundColor: kWhite,
                    radius: 15,
                    child: Icon(
                      Icons.arrow_forward,
                      color: kblue,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    buildTopRow(),
                      const Gap(20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Gap(20),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const Dashboard(),
                                        ),
                                      );
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
                          const Gap(20),
                          Text(
                            'Search results',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 28.sp,
                            ),
                          ),
                          Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: SizedBox(
                                height: 181.h,
                                width: 348.w,
                                child: Image.asset(
                                  'assets/images/demo.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const Gap(10),
                          AutoSizeText(
                            'Paracetamol results in lagos',
                            maxLines: 1,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp,
                            ),
                          ),
                          const Gap(20),
                          Center(
                            child: Column(
                              children: [
                                _buildPharmacyCard('Amana Pharmacy Ltd',
                                    'Ikotun      Lagos   '),
                                const Gap(30),
                                _buildPharmacyCard('Amana Pharmacy Ltd',
                                    'Ikotun      Lagos   '),
                                const Gap(30),
                                _buildPharmacyCard('Amana Pharmacy Ltd',
                                    'Ikotun      Lagos   '),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
