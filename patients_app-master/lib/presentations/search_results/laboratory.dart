import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patients/common_widget/top_row.dart';
import 'package:patients/core/style/color/colors.dart';
import 'package:patients/inventory/inventory.dart';
import 'package:patients/inventory/investigatordetails.dart';
import 'package:patients/presentations/dashboard/dashboard.dart';

class LaboratorySearch extends StatefulWidget {
  const LaboratorySearch({super.key});

  @override
  State<LaboratorySearch> createState() => _LaboratorySearchState();
}

class _LaboratorySearchState extends State<LaboratorySearch> {
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
                        builder: (context) => const Investigastordetails(),
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
                                  builder: (context) => const Dashboard(),
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
                            'Blood test in lagos',
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
                                    'Braxi Diagnostics',
                                    'ikotun',
                                    '24mins from you',
                                    'Offers sample delivery',
                                    'Lagos'),
                                const Gap(30),
                                _buildPharmacyCard(
                                    'Comido Labs',
                                    'Lekki',
                                    '1hr from you',
                                    'Offers sample delivery',
                                    'Lagos'),
                                const Gap(30),
                                _buildPharmacyCard(
                                    'Asuna Investgations',
                                    'Lekki',
                                    '1hr from you',
                                    'Offers sample delivery',
                                    'Lagos'),
                                const Gap(30),
                                _buildPharmacyCard(
                                    'Asuna Investgations',
                                    'Lekki',
                                    '1hr from you',
                                    'Offers sample delivery',
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
