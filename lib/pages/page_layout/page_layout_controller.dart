import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiringbell/models/navigate.dart';
import 'package:hiringbell/models/user.dart';

class PageLayoutController extends GetxController {
  var selectedIndex = 0.obs;
  final page = <String>[Navigate.home, Navigate.findFriends, Navigate.profile, Navigate.notification, Navigate.post];

  User user = User();

  void onItemTapped(var index) {
    selectedIndex(index);
  }
}