import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiringbell/models/key_value_items.dart';
import 'package:hiringbell/models/post_job.dart';

import '../../services/http_service.dart';

class JobPostController extends GetxController {
  final formKey = GlobalKey<FormState>();
  var isSubmitted = false.obs;
  final isLoading = RxBool(false);
  final http = HttpService.getInstance();
  final jobTitle = TextEditingController();
  final jobDescription = TextEditingController();

  var openFlags = [false, false, false].obs;

  JobPost jobPost = JobPost.withoutParam();

  updateAllowanceExpansion(int index, bool isOpen) {
    openFlags[index] = isOpen;
  }

  saveFormData() {
    formKey.currentState!.validate();
  }

  List<KeyValuePair> categories = <KeyValuePair>[
    KeyValuePair(text: 'Driver', value: 1),
    KeyValuePair(text: 'Electrician', value: 2),
    KeyValuePair(text: 'Mechanical Fitter', value: 3),
  ];

  List<KeyValuePair> countries = <KeyValuePair>[
    KeyValuePair(text: 'Driver', value: 1),
    KeyValuePair(text: 'Electrician', value: 2),
    KeyValuePair(text: 'Mechanical Fitter', value: 3),
  ];

  var days = <String>[
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday'
  ];

  List<String> list = <String>[
    'Select Category',
    'Mechanical fitter',
    'Two',
    'Three',
    'Four'
  ];

  String dropdownValue = 'Select Category';

  List<String> months = <String>[
    'Year',
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12'
  ];

  void onItemSelected(KeyValuePair value) {
    debugPrint("$value");
  }

  InputDecoration getFiledInputDecoration(String hint, {double iconSize = 20}) {
    return InputDecoration(
      border: const OutlineInputBorder(),
      filled: true,
      fillColor: Colors.white,
      prefixIcon: Icon(
        Icons.currency_rupee,
        color: Colors.blueAccent,
        size: iconSize,
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 2,
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
      hintText: hint,
    );
  }
}
