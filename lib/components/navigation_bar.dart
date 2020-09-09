import 'package:flutter/material.dart';
import 'package:user_app/screens/order_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:user_app/screens/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:user_app/screens/home_screen.dart';
import 'package:user_app/screens/request_screen.dart';

class NavBar extends StatelessWidget {
  List<Widget> _buildScreens() {
    return [
     RequistScreen(),
      OrderScreen(),
      ProfileScreen(),

    ];
  }

  final PersistentTabController _controller =
  PersistentTabController(initialIndex: 0);

  List<PersistentBottomNavBarItem> _navBarsItems() {
    // ignore: always_specify_types
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        // ignore: unnecessary_parenthesis
        title: ('Home'),
        activeColor: CupertinoColors.black,
        inactiveColor: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.reorder),
        // ignore: unnecessary_parenthesis
        title: ('orders'),
        activeColor: CupertinoColors.black,
        inactiveColor: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.person_solid),
        // ignore: unnecessary_parenthesis
        title: ('profile'),
        activeColor: CupertinoColors.black,
        inactiveColor: CupertinoColors.systemGrey,
      ),

    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      // katak keybord dabetawa.
      resizeToAvoidBottomInset: true,
      hideNavigationBarWhenKeyboardShows: true,
      stateManagement: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style1,
    );
  }
}
