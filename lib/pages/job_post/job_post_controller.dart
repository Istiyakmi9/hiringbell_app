import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hiringbell/models/constants.dart';
import 'package:hiringbell/models/files.dart';
import 'package:hiringbell/models/key_value_items.dart';
import 'package:hiringbell/models/post_job.dart';
import 'package:hiringbell/utilities/Util.dart';
import 'package:image_picker/image_picker.dart';

import '../../services/http_service.dart';

class JobPostController extends GetxController {
  final formKey = GlobalKey<FormState>();
  var isSubmitted = false.obs;
  final isLoading = RxBool(false);
  final http = HttpService.getInstance();
  final jobTitle = TextEditingController();
  final jobDescription = TextEditingController();
  final util = Util.getInstance();
  List<XFile> selectedFiles = [];

  var pickedImages = RxList<XFile>([]).obs;
  var isImagePicked = true.obs;
  var isFileReady = false.obs;
  var overtimeFlag = false.obs;

  var openFlags = [false, false, false].obs;
  var experienceFlag = false.obs;

  JobPost jobPost = JobPost.noArg();

  updateIsSubmitted(bool flag) {
    isSubmitted.value = flag;
  }

  updateAllowanceExpansion(int index, bool isOpen) {
    openFlags[index] = isOpen;
  }

  updateExperienceFlag(int index, bool isOpen) {
    experienceFlag.value = isOpen;
  }

  updateOvertimeFlag(int index, bool isOpen) {
    overtimeFlag.value = isOpen;
  }

  getWeekdaysStatus(int i) {
    switch (i) {
      case 1:
        return jobPost.isMon ?? false;
      case 2:
        return jobPost.isTue ?? false;
      case 3:
        return jobPost.isWed ?? false;
      case 4:
        return jobPost.isThu ?? false;
      case 5:
        return jobPost.isFri ?? false;
      case 6:
        return jobPost.isSat ?? false;
      case 7:
        return jobPost.isSun ?? false;
    }
  }

  updateWeekdaysStatus(int i) {
    switch (i) {
      case 1:
        jobPost.isMon = true;
      case 2:
        jobPost.isTue = false;
      case 3:
        jobPost.isWed = false;
      case 4:
        jobPost.isThu = false;
      case 5:
        jobPost.isFri = false;
      case 6:
        jobPost.isSat = false;
      case 7:
        jobPost.isSun = false;
    }
  }

  var days = <KeyValuePair>[
    KeyValuePair(text: 'Sunday', value: 1),
    KeyValuePair(text: 'Monday', value: 2),
    KeyValuePair(text: 'Tuesday', value: 3),
    KeyValuePair(text: 'Wednesday', value: 4),
    KeyValuePair(text: 'Thursday', value: 5),
    KeyValuePair(text: 'Friday', value: 6),
    KeyValuePair(text: 'Saturday', value: 7),
  ];

  saveFormData() {
    bool flag = formKey.currentState!.validate();
    if (flag) {
      int i = 0;
      jobPost.files = [];
      var files = <FileDetail>[];
      for (var element in selectedFiles) {
        files.add(
          FileDetail(
            fileDetailId: ++i,
            filePath: element.path,
          ),
        );
      }

      // jobPost.fileDetail = jsonEncode(JobPost.getJsonList(files));
      jobPost.fileDetail = "[]";
      http
          .upload("core/userposts/uploadUserPostsMobile", pickedImages.value,
              JobPost.toJson(jobPost))
          .then((value) => {
                if (value != null || value == "success")
                  {
                    Get.back(result: "Post published successfully"),
                  }
                else
                  {
                    updateIsSubmitted(false),
                    util.showToast("Fail to post. Please contact admin.",
                        type: Constants.fail),
                  }
              });
    } else {
      util.showToast("Invalid form", type: Constants.fail);
    }
  }

  List<KeyValuePair> categories = <KeyValuePair>[
    KeyValuePair(text: 'Driver', value: 1),
    KeyValuePair(text: 'Electrician', value: 2),
    KeyValuePair(text: 'Mechanical Fitter', value: 3),
  ];

  List<KeyValuePair> countries = <KeyValuePair>[
    KeyValuePair(text: 'India', value: 1),
    KeyValuePair(text: 'UAE', value: 2),
    KeyValuePair(text: 'Qatar', value: 3),
  ];

  List<int> generateRandomNumber({int range = 50}) {
    return List.generate(range, (i) => i + 1);
  }

  void onItemSelected(KeyValuePair value) {
    debugPrint("$value");
  }

  pickImages() async {
    try {
      isImagePicked.value = false;
      selectedFiles = await ImagePicker().pickMultiImage(limit: 5);
      if (selectedFiles.isNotEmpty) {
        pickedImages.value.addAll(selectedFiles);
        isFileReady.value = true;
      } else {
        isFileReady.value = false;
        util.showToast("Unable to pick any images");
      }

      isImagePicked.value = true;
    } on PlatformException catch (e) {
      isFileReady.value = false;
      debugPrint('Failed to pick image: $e');
    }
  }

  removeImage(String fileName) {
    selectedFiles.removeWhere((elem) => elem.name == fileName);
    pickedImages.value.clear();
    pickedImages.value.addAll(selectedFiles);
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
