import 'package:flutter/material.dart';
import 'package:hiringbell/pages/findFriends/findFriends_page.dart';
import 'package:hiringbell/pages/home/home_page.dart';
import 'package:hiringbell/pages/profile/profile_page.dart';

class PageManager extends StatelessWidget {
  int index;
  PageManager({super.key, required this.index});

  Widget getScreen() {
    Widget widget;
    switch (index) {
      case 1:
        widget = const FindFriendsPage();
        break;
      case 2:
        widget = const ProfilePage();
        break;
      default:
        widget = const HomePage();
        break;
    }

    return widget;
  }

  @override
  Widget build(BuildContext context) {
    return getScreen();
  }
}
