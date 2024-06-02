import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hiringbell/models/constants.dart';
import 'package:hiringbell/models/country.dart';
import 'package:hiringbell/models/currency.dart';
import 'package:hiringbell/models/files.dart';
import 'package:hiringbell/models/job_type.dart';
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
  // final jobMinimumCTC = TextEditingController();
  // final jobMaximumCTC = TextEditingController();
  // final jobBonus = TextEditingController();
  // final jobSpecialAllowances = TextEditingController();
  // final jobHRA = TextEditingController();
  // final jobTRA = TextEditingController();
  // final jobFoodAllowances = TextEditingController();

  // final jobDailyWorkingHours = TextEditingController();
  // final jobOverseasExperience = TextEditingController();
  final util = Util.getInstance();
  List<XFile> selectedFiles = [];

  var pickedImages = RxList<XFile>([]).obs;
  var isImagePicked = true.obs;
  var isFileReady = false.obs;
  var overtimeFlag = false.obs;

  var openFlags = [false, false, false].obs;
  var experienceFlag = false.obs;

  List<JobType> listJobType = [];
  List<Currency> listCurrency = [];
  List<Country> listCountry = [];

  List<KeyValuePair> listMedicalInsurance = [
    KeyValuePair(text: 'By company', value: 1),
    KeyValuePair(text: 'No insurance', value: 2),
  ];

  List<KeyValuePair> listVisaType = [
    KeyValuePair(text: 'Tourist', value: 1),
    KeyValuePair(text: 'Employment', value: 2),
  ];

  List<int> listMinAge = List.generate(100, (i) => i + 0);
  List<int> listMaxAge = List.generate(100, (i) => i + 0);
  List<int> listOverTime = List.generate(100, (i) => i + 0);
  List<int> listDailyWorkingHours = List.generate(100, (i) => i + 0);
  List<int> listExperience = List.generate(100, (i) => i + 0);
  List<int> listMonths = List.generate(13, (i) => i + 0);

  JobPost jobPost = JobPost.noArg();
  int? jobPostId_;

  JobPostController({this.jobPostId_});

  int get overseasExperienceYears => jobPost.overseasExperience ~/ 12;
  int get overseasExperienceMonths => jobPost.overseasExperience % 12;

  int get localExperienceYears => jobPost.localExperience ~/ 12;
  int get localExperienceMonths => jobPost.localExperience % 12;

  Future<void> onInitRefresh() async {
    jobPostId_ ??= 0;
    try {
      isLoading(true);
      await loadFormData(jobPostId_!);
    } finally {
      isLoading(false);
    }
  }

  // assignExistingPost(Posts? post) {
  //   // post.userPostId
  //   // update();
  //   loadFormData(post?.userPostId ?? 0);
  // }

  refreshEditValues(JobPost post) {
    // jobPost.shortDescription = post.job
    // jobTitle.text = post.shortDescription ?? Constants.empty;
    // jobDescription.text = post.completeDescription ?? Constants.empty;
    // jobMinimumCTC.text = post.minimumCTC.toString();
    // jobMaximumCTC.text = post.maximumCTC.toString();
    // jobBonus.text = post.bonus.toString();
    // // jobSpecialAllowances.text = post..toString();
    // jobHRA.text = post.hraAllowanceAmount.toString();
    // jobTRA.text = post.travelAllowanceAmount.toString();
    // jobFoodAllowances.text = post.foodAllowanceAmount.toString();
    //wasay
  }

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

  Future<void> loadFormData(int userPostId) async {
    try {
      var value = await http
          .httpGet("core/userposts/getUserPostByUserPostId/$userPostId");
      // .then((value) {

      List<dynamic> curr = value["Currencies"];
      listCurrency = Currency.fromJsonList(curr);

      List<dynamic> country = value["Countries"];
      listCountry = Country.fromJsonList(country);

      List<dynamic> jobType = value["JobTypes"];
      listJobType = JobType.fromJsonList(jobType);

      if (jobPostId_ == 0) {
        return;
      }
      var userPosts = value["UserPost"][0];
      if (userPosts != null) {
        jobPost = JobPost.fromJson(userPosts);
      } else {
        util.showToast("Fail to load the data");
      }
    } catch (e) {
      util.showToast("Fail to load the data");
    }
  }

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
