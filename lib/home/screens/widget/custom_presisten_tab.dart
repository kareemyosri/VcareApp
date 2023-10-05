import 'package:flutter/material.dart';
import 'package:my_app/account/screens/profile_screen.dart';
import 'package:my_app/all_doctor/screens/widget/all_doctor_screen_body.dart';
import 'package:my_app/history/screens/history_screen.dart';
import 'package:my_app/home/screens/widget/home_page_body.dart';
import 'package:my_app/search/screens/widget/search_screen_body.dart';
import 'package:my_app/util/app_const.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class CustomPresistenTabview extends StatelessWidget {
  const CustomPresistenTabview({super.key});

  @override
  Widget build(BuildContext context) {
    PersistentTabController _controllre =
        PersistentTabController(initialIndex: 0);
    return PersistentTabView(
      context,
      controller: _controllre,
      screens: const [
        HomePageBody(),
        AllDoctorScreenBody(),
        SearchScreenBody(),
HistoryScreen(),        ProfileScreen()
      ],
      items: [
        PersistentBottomNavBarItem(
          icon: const Icon(
            Icons.home,
            color: AppConst.baseColor,
          ),
          title: ("Home"),
          activeColorPrimary: AppConst.baseColor,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(
            Icons.local_hospital,
            color: AppConst.baseColor,
          ),
          title: ("Doctor"),
          activeColorPrimary: AppConst.baseColor,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
          title: ("Search"),
          activeColorPrimary: AppConst.baseColor,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(
            Icons.schedule_outlined,
            color: AppConst.baseColor,
          ),
          title: ("History"),
          activeColorPrimary: AppConst.baseColor,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(
            Icons.person,
            color: AppConst.baseColor,
          ),
          title: ("Person"),
          activeColorPrimary: AppConst.baseColor,
          inactiveColorPrimary: Colors.grey,
        ),
      ],
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),

      navBarStyle:
          NavBarStyle.style15, // Choose the nav bar style with this property.
    );
  }
}
