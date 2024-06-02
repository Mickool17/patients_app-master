import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patients/common_widget/custom_image_view.dart';
import 'package:patients/core/style/color/colors.dart';
import 'package:patients/presentations/home/home_screen.dart';
import 'package:patients/presentations/profile/profile.dart';
import 'package:patients/presentations/records/records.dart';
import 'package:patients/presentations/wallet/wallet.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    List pages = [
      const HomePage(),
      const Records(),
      const Text("Add"),
      const Wallet(),
      const Profile(),
    ];
    return Scaffold(
      body: SafeArea(
        child: pages[pageIndex],
      ),
      bottomNavigationBar: NavigationBar(
        
        elevation: 0,
        backgroundColor: Colors.white,
        onDestinationSelected: (value) => setState(
          () {
            pageIndex = value;
          },
        ),
        indicatorShape: const CircleBorder(),
        indicatorColor: kPrimary,
        selectedIndex: pageIndex,
        destinations: [
          NavigationDestination(
            selectedIcon: CustomImageView(
              svgPath: 'assets/icons/Home.svg',
              height: 20.w,
              // width: 25.w,
              color: Colors.white,
            ),
            icon: CustomImageView(
              svgPath: 'assets/icons/Home.svg',
              height: 20.w,
              width: 25.w,
            ),
            label: '',
          ),
          NavigationDestination(
            icon: CustomImageView(
              svgPath: 'assets/icons/List.svg',
              height: 20.w,
              width: 25.w,
            ),
            selectedIcon: CustomImageView(
              svgPath: 'assets/icons/List.svg',
              height: 25.w,
              width: 25.w,
              color: Colors.white,
            ),
            label: '',
          ),
          NavigationDestination(
            icon: CustomImageView(svgPath: 'assets/icons/Add.svg'),
            selectedIcon: CustomImageView(
              svgPath: 'assets/icons/Add.svg',
              color: Colors.white,
            ),
            label: '',
          ),
          NavigationDestination(
            icon: CustomImageView(svgPath: 'assets/icons/card.svg'),
            selectedIcon: CustomImageView(
              svgPath: 'assets/icons/card.svg',
              height: 20.w,
              color: Colors.white,
            ),
            label: '',
          ),
          NavigationDestination(
            icon: CustomImageView(
              svgPath: 'assets/icons/Profile.svg',
              height: 20.w,
              width: 20.w,
            ),
            selectedIcon: CustomImageView(
              svgPath: 'assets/icons/Profile.svg',
              color: Colors.white,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
