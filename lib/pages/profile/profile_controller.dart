import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hiringbell/models/user.dart';
import 'package:hiringbell/utilities/Util.dart';

class ProfileController extends GetxController {
  User user = User();

  Future<void> onRefresh() async {
    debugPrint("Refreshing page...");
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Util util = Util.getInstance();
    user = util.getUserDetail();

    debugPrint("Profile page scroll handler initialized...");
  }
}