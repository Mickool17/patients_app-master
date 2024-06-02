import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patients/common_widget/custom_image_view.dart';
import 'package:patients/presentations/home/home_screen.dart';
import 'package:patients/presentations/records/records.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class Dashboard2 extends StatefulWidget {
  const Dashboard2({Key? key}) : super(key: key);

  @override
  State<Dashboard2> createState() => _Dashboard2State();
}

class _Dashboard2State extends State<Dashboard2> {
  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      const HomePage(),
      const Records(),
      const Text("Add"),
      const Text("Card"),
      const Text("Profile"),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: CustomImageView(
          
          svgPath: 'assets/icons/Home.svg',
          height: 20.w,
          width: 25.w,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: CustomImageView(
          svgPath: 'assets/icons/List.svg',
          height: 20.w,
          width: 25.w,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: CustomImageView(svgPath: 'assets/icons/Add.svg'),
      ),
      PersistentBottomNavBarItem(
        icon: CustomImageView(svgPath: 'assets/icons/card.svg'),
      ),
      PersistentBottomNavBarItem(
        icon: CustomImageView(
          svgPath: 'assets/icons/Profile.svg',
          height: 20.w,
          width: 20.w,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView.custom(
      context,
      controller: _controller,
      itemCount: 5,
      screens: _buildScreens(),
      confineInSafeArea: true,
      handleAndroidBackButtonPress: true,
      onWillPop: (BuildContext? context) async {
        setState(() {});
        return true;
      },
      customWidget: CustomNavBarWidget(
        items: _navBarsItems(),
        selectedIndex: _controller.index,
        onItemSelected: (index) {
          setState(() {
            _controller.index = index;
          });
        },
      ),
    );
  }
}

class CustomNavBarWidget extends StatelessWidget {
  final int selectedIndex;
  final List<PersistentBottomNavBarItem> items;
  final ValueChanged<int> onItemSelected;

  CustomNavBarWidget({
    Key? key,
    required this.selectedIndex,
    required this.items,
    required this.onItemSelected,
  }) : super(key: key);

  Widget _buildItem(PersistentBottomNavBarItem item, bool isSelected) {
    return Container(
      alignment: Alignment.center,
      height: 60.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: IconTheme(
              data: IconThemeData(
                size: 26.0,
                color: isSelected
                    ? (item.activeColorSecondary == null
                        ? item.activeColorPrimary
                        : item.activeColorSecondary)
                    : item.inactiveColorPrimary == null
                        ? item.activeColorPrimary
                        : item.inactiveColorPrimary,
              ),
              child: item.icon,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Material(
              type: MaterialType.transparency,
              child: FittedBox(
                child: Text(
                  '',
                  style: TextStyle(
                    color: isSelected
                        ? (item.activeColorSecondary == null
                            ? item.activeColorPrimary
                            : item.activeColorSecondary)
                        : item.inactiveColorPrimary,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material( // Wrap with Material Widget
      color: Colors.white,
      child: Container(
        width: double.infinity,
        height: 60.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items.map((item) {
            int index = items.indexOf(item);
            return Flexible(
              child: GestureDetector(
                onTap: () {
                  this.onItemSelected(index);
                },
                child: _buildItem(item, selectedIndex == index),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
