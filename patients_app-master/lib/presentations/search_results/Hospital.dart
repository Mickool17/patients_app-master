import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patients/common_widget/top_row.dart';
import 'package:patients/core/style/color/colors.dart';
import 'package:patients/inventory/Hospital_details.dart';
import 'package:patients/inventory/inventory.dart';
import 'package:patients/presentations/dashboard/dashboard.dart';

class HospitalSearch extends StatefulWidget {
  const HospitalSearch({super.key});

  @override
  State<HospitalSearch> createState() => _MedicationSearchState();
}

class _MedicationSearchState extends State<HospitalSearch> {
  Widget _buildPharmacyCard(String pharmacyName, String location, String time,
      String consultation, String state) {
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
            AutoSizeText(
              pharmacyName,
              maxLines: 1,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
                color: kWhite,
              ),
            ),
            Row(
              children: [
                AutoSizeText(
                  time,
                  maxLines: 1,
                  style: TextStyle(fontSize: 14.sp, color: kWhite),
                ),
                const Gap(2),
                _buildDot(),
                const SizedBox(width: 4),
                AutoSizeText(
                  consultation,
                  maxLines: 1,
                  style: TextStyle(fontSize: 14.sp, color: kWhite),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    AutoSizeText(
                      location,
                      maxLines: 1,
                      style: TextStyle(fontSize: 14.sp, color: kWhite),
                    ),
                     const Gap(2),
                    _buildDot(),
                    const SizedBox(width: 4),
                    AutoSizeText(
                      state,
                      maxLines: 1,
                      style: TextStyle(fontSize: 14.sp, color: kWhite),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Hospitaldetails(),
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
                          const Gap(10),
                          AutoSizeText(
                            'SouthWest Medicals results in lagos',
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
                                _buildPharmacyCard(
                                    'SouthWest Medicals',
                                    'ikotun',
                                    '24mins from you',
                                    'Free consultation',
                                    'Lagos'),
                                const Gap(30),
                                _buildPharmacyCard(
                                    'SouthWest Medicals',
                                    'Lekki',
                                    '1hr from you',
                                    'Free consultation',
                                    'Lagos'),
                                const Gap(30),
                                _buildPharmacyCard(
                                    'SouthWest Medicals',
                                    'Lekki',
                                    '1hr from you',
                                    'Free consultation',
                                    'Lagos'),
                                    const Gap(30),
                                _buildPharmacyCard(
                                    'SouthWest Medicals',
                                    'Lekki',
                                    '1hr from you',
                                    'Free consultation',
                                    'Lagos'),
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

Widget _buildDot() {
  return Container(
    width: 4,
    height: 6,
    decoration: const BoxDecoration(
      color: kWhite,
      shape: BoxShape.circle,
    ),
  );
}
