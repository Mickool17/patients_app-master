import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patients/common_widget/custom_card.dart';
import 'package:patients/common_widget/custom_circular_avatar.dart';
import 'package:patients/common_widget/custom_image_view.dart';
import 'package:patients/common_widget/custom_textfield.dart';
import 'package:patients/common_widget/vitals_tracker_widget.dart';
import 'package:patients/core/style/color/colors.dart';
import 'package:patients/presentations/appointments/appointment.dart';
import 'package:patients/presentations/purchases/purchases.dart';
import 'package:patients/presentations/search_results/Hospital.dart';
import 'package:patients/presentations/search_results/laboratory.dart';
import 'package:patients/presentations/search_results/relianceeheath.dart';

import '../../common_widget/top_row.dart';
import '../search_results/Medication.dart';
import '../vitals_tracker/vitals_tracker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showOverlay = false;

  bool get showOverlay => _showOverlay;

  void toggleOverlay() {
    setState(() {
      _showOverlay = !_showOverlay;
    });
  }

  String? selectedItem;

  void onItemSelected(String item) {
    setState(() {
      selectedItem = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
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
                      "Hi, Ife",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(15),
                    buildPatientIdContainer(),
                    const Gap(15),
                    buildSearchField(),
                    const Gap(20),
                    buildVitalsTrackerCard(context),
                    const Gap(20),
                    buildAppointmentCard(),
                    const Gap(20),
                    buildPurchaseCard(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      if (_showOverlay)
        _buildOverlay(context, toggleOverlay, selectedItem, onItemSelected),
    ]);
  }

  Widget buildPatientIdContainer() {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 33, vertical: 10.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: kPrimary,
      ),
      child: Row(
        children: [
          CustomImageView(
            height: 70,
            svgPath: 'assets/images/folder_image.svg',
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Patient ID",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "123456789",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildSearchField() {
    return GestureDetector(
      onTap: () {
        toggleOverlay();
      },
      child: const RoundTextField(
        hitText: 'Search for hospital, medication, lab, HMO etc',
        icon: Icon(Icons.search),
        isEnable: false,
      ),
    );
  }

  Widget buildVitalsTrackerCard(BuildContext context) {
    return CustomCard(
      title: 'Vitals tracker',
      name: 'Temperature',
      reading: '+3%',
      cardGradient: kTemperature,
      cardColor: kBlack,
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const VitalsTracker(),
          ),
        );
      },
      list: Row(
        children: [
          CustomImageView(
            height: 30.h,
            svgPath: 'assets/images/temperature.svg',
          ),
        ],
      ),
      tempReading: '31C',
    );
  }

  Widget buildAppointmentCard() {
    const appointmentDetailsTextStyle = TextStyle(color: Colors.white);

    return CustomCard2(
      color: kPrimary,
      title: "Appointment",
      name: "Igbobi General Hospital - In person",
      widget: buildAppointmentDetails(appointmentDetailsTextStyle),
      onTap: () {
         Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const Appointments(),
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
        const Gap(15),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomImageView(imagePath: "assets/icons/calendar.png"),
            Expanded(
              child: AutoSizeText(
                "Fri Dec 22 * 10:00am - 12:00pm",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: appointmentDetailsTextStyle,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildPurchaseCard() {
    return CustomCard2(
      title: "Purchases",
      name: 'Precription #1346789',
      widget: buildPurchaseDetails(),
      color: kGreenColor,
      onTap: () {
          Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const Purchases(),
          ));
      },
    );
  }

  Widget buildPurchaseDetails() {
    return Column(
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
    );
  }
}

Widget _buildOverlay(BuildContext context, VoidCallback onTap,
    String? selectedItem, Function(String) onItemSelected) {
  return GestureDetector(
    onTap: onTap,
    behavior: HitTestBehavior.opaque,
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Container(
        color: Colors.black.withOpacity(0.5),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: GestureDetector(
            onTap: () {},
            child: SingleChildScrollView(
              child: Container(
                height: 548.h,
                width: 393.w,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(40),
                  ),
                  color: kWhite,
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: AutoSizeText(
                          "Search filter",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w700),
                          maxLines: 1,
                        ),
                      ),
                      const RoundTextField(
                          hitText: 'Search name',
                          icon: Icon(
                            Icons.search,
                            color: kblue,
                          )),
                      const Text("or"),
                      Container(
                        height: 52.h,
                        width: 450.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: kblue),
                        child: const Row(
                          children: [
                            Gap(15),
                            Icon(
                              Icons.pin_drop,
                              color: kWhite,
                            ),
                            Gap(20),
                            Text(
                              'Upload Document',
                              style: TextStyle(color: kWhite),
                            )
                          ],
                        ),
                      ),
                      const RoundTextField(
                          hitText: 'Location',
                          icon: Icon(
                            Icons.search,
                            color: kblue,
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SelectableContainer(
                            height: 28,
                            width: 115,
                            label: 'Laboratory',
                            isSelected: selectedItem == 'Laboratory',
                            onTap: () => onItemSelected('Laboratory'),
                          ),
                          SelectableContainer(
                            width: 92,
                            height: 28,
                            label: 'Hospital',
                            isSelected: selectedItem == 'Hospital',
                            onTap: () => onItemSelected('Hospital'),
                          ),
                          SelectableContainer(
                            width: 113,
                            height: 28,
                            label: 'Medication',
                            isSelected: selectedItem == 'Medication',
                            onTap: () => onItemSelected('Medication'),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SelectableContainer(
                            width: 156,
                            height: 28,
                            label: 'Health insurance',
                            isSelected: selectedItem == 'Health insurance',
                            onTap: () => onItemSelected('Health insurance'),
                          ),
                          SelectableContainer(
                            width: 175,
                            height: 28,
                            label: 'Diagnostics Imaging',
                            isSelected: selectedItem == 'Diagnostics Imaging',
                            onTap: () => onItemSelected('Diagnostics Imaging'),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.red,
                                  width: 2.0,
                                ),
                              ),
                              width: 150.w,
                              height: 48.h,
                              child: Center(
                                child: AutoSizeText(
                                  'Discard',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500),
                                  maxLines: 1,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 18.w,
                            ),
                            GestureDetector(
                              onTap: () {
                                if (selectedItem != null) {
                                  switch (selectedItem) {
                                    case 'Medication':
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const MedicationSearch(),
                                        ),
                                      );
                                      break;
                                    case 'Hospital':
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const HospitalSearch(),
                                        ),
                                      );
                                    case 'Laboratory':
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const LaboratorySearch(),
                                        ),
                                      );
                                      case 'Health insurance':
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const HealthSearch(),
                                        ),
                                      );
                                      break;
                                  }
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: kblue,
                                ),
                                width: 150.w,
                                height: 48.h,
                                child: const Center(
                                  child: Text(
                                    'Search',
                                    style: TextStyle(color: kWhite),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

class SelectableContainer extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final double width;
  final double height;

  const SelectableContainer({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.r),
          color: isSelected ? kBlack : Colors.transparent,
          border: Border.all(color: isSelected ? kYellowColor : kBlack),
        ),
        width: width.w,
        height: height.h,
        child: Center(
          child: AutoSizeText(
            label,
            style: TextStyle(color: isSelected ? kYellowColor : kBlack),
            maxLines: 1,
          ),
        ),
      ),
    );
  }
}
