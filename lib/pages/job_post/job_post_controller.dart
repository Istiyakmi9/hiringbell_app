import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/http_service.dart';

class JobPostController extends GetxController {
  final formKey = GlobalKey<FormState>();
  var isSubmitted = false.obs;
  final isLoading = RxBool(false);
  final http = HttpService.getInstance();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  List<String> list = <String>['Select Category', 'Mechanical fitter', 'Two', 'Three', 'Four'];
  String dropdownValue = 'Select Category';

  validateUserName(String? username) {
    if (username == null || username.isEmpty) {
      return "Invalid username";
    }

    return null;
  }

  validatePassword(String? username) {
    if (username == null || username.isEmpty) {
      return "Invalid password";
    }

    return null;
  }
}