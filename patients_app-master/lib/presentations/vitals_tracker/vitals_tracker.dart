import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patients/common_widget/custom_circular_avatar.dart';
import 'package:patients/common_widget/custom_image_view.dart';
import 'package:patients/common_widget/top_row.dart';
import 'package:patients/common_widget/vitals_tracker_widget.dart';
import 'package:patients/core/style/color/colors.dart';
import 'package:patients/presentations/filter_analysis/Diastolic_bp.dart';
import 'package:patients/presentations/filter_analysis/Systolic_bp_analysis.dart';
import 'package:patients/presentations/filter_analysis/blood_sugar.dart';
import 'package:patients/presentations/filter_analysis/height.dart';
import 'package:patients/presentations/filter_analysis/pulse.dart';
import 'package:patients/presentations/filter_analysis/temprature_analysis.dart';
import 'package:patients/presentations/filter_analysis/weight.dart';

class VitalsTracker extends StatelessWidget {
  const VitalsTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 15.h),
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
                    
                    const Gap(20),
                      GestureDetector(
                        onTap: (){
                           Navigator.push(context, MaterialPageRoute(builder: (_)=>const TemperatureAnalysis()));
                        },
                        child: CustomCard(
                          title: 'Vitals tracker',
                          name: 'Temperature',
                          reading: '+3%',
                          showUpdateDetails: true,
                          onTap: () {
                           
                            
                          },
                          cardGradient: kTemperature,
                          cardColor: kBlack,
                          showArrow: true,
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
                      ),
                      const Gap(20),
                      GestureDetector(
                        onTap: () {
                             Navigator.push(context, MaterialPageRoute(builder: (_)=>const SystolicBp()));
                        },
                        child: CustomCard(
                        
                          name: 'Systolic blood pressure',
                          reading: '+100%',
                          cardColor: kPrimary,
                          showArrow: true,
                          list: Row(
                            children: [
                              CustomImageView(
                                height: 30.h,
                                svgPath: 'assets/images/temperature.svg',
                              ),
                              // const Spacer(),
                            ],
                          ),
                          tempReading: '173mmHg',
                        ),
                      ),
                      const Gap(20),
                      GestureDetector(
                        onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>const DiastolicBp()));
                        },
                        child: CustomCard(
                                             
                          name: 'Diastolic blood pressure',
                          reading: '+3%',
                          showArrow: true,
                          cardColor: kGreenColor,
                          list: Row(
                            children: [
                              CustomImageView(
                                height: 30.h,
                                svgPath: 'assets/images/temperature.svg',
                              ),
                              // const Spacer(),
                            ],
                          ),
                          tempReading: '82mmHg',
                        ),
                      ),
                      const Gap(20),
                      GestureDetector(
                        onTap: () {
                             Navigator.push(context, MaterialPageRoute(builder: (_)=>const Pulse()));
                        },
                        child: CustomCard(
                                           
                          name: 'Pulse',
                          reading: '+3%',
                          cardColor: kRedColor,
                          showArrow: true,
                          list: Row(
                            children: [
                              CustomImageView(
                                height: 30.h,
                                svgPath: 'assets/images/temperature.svg',
                              ),
                              // const Spacer(),
                            ],
                          ),
                          tempReading: '28bpm',
                        ),
                      ),
                      const Gap(20),
                      GestureDetector(
                        onTap: () {
                             Navigator.push(context, MaterialPageRoute(builder: (_)=>const Weight()));
                        },
                        child: CustomCard(
                                        
                          name: 'Weight',
                          reading: '+3%',
                          showArrow: true,
                          cardColor: kGreyColor,
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
                      ),
                      const Gap(20),
                     GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>const Height()));
                      },
                       child: CustomCard(
                                         
                          name: 'Height',
                          reading: '+3%',
                          showArrow: true,
                          cardColor: kWineColor,
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
                     ),
                      const Gap(20),
                     GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>const BloodSugar()));
                      },
                       child: CustomCard(
                                         
                          name: 'Blood sugar',
                          reading: '+3%',
                          cardColor: kYellowColor,
                          showArrow: true,
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
                     ),
                      const Gap(20)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
