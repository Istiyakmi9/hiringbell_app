import 'dart:convert';
import 'dart:ffi';

import 'package:hiringbell/models/constants.dart';
import 'package:jiffy/jiffy.dart';

class User {
  String? address = Constants.empty;
  String? city = Constants.empty;
  DateTime createdOn = DateTime.now();
  String email = Constants.empty;
  int userId = 0;
  String firstName = Constants.empty;
  String lastName = Constants.empty;
  String mobile = Constants.empty;
  String? password = Constants.empty;
  String? state = Constants.empty;
  int jobCategoryId = 0;
  List<int> categoryTypeIds = [];
  List<int> jobLocationIds = [];
  bool isActive = false;
  String? token = Constants.empty;

  static final User instance = User._internal();

  factory User() {
    return instance;
  }

  User._internal();

  User.fromUser(
      this.address,
      this.city,
      this.createdOn,
      this.email,
      this.firstName,
      this.lastName,
      this.mobile,
      this.jobCategoryId,
      this.state,
      this.userId,
      this.categoryTypeIds,
      this.jobLocationIds,
      this.isActive,
      this.token,
      );

  static DateTime toDateTime(String? date) {
    if (date != null && date != "") {
      return Jiffy.parse(date).dateTime;
    } else {
      return DateTime.now();
    }
  }

  factory User.fromJson(dynamic json) {
    instance.address = json["address"];
    instance.city = json["city"];
    instance.createdOn = toDateTime(json["createdOn"]);
    instance.email = json["email"];
    instance.firstName = json["firstName"];
    instance.lastName = json["lastName"];
    instance.mobile = json["mobile"] ?? "";
    instance.jobCategoryId = json["jobCategoryId"];
    instance.state = json["state"] ?? "";
    instance.userId = json["userId"];

    List<int> categoryIds = (jsonDecode(json["categoryTypeIds"]) as List<dynamic>).cast<int>();
    instance.categoryTypeIds = categoryIds ?? [];

    var locationIds = (jsonDecode(json["jobLocationIds"]) as List<dynamic>).cast<int>();
    instance.jobLocationIds = locationIds ?? [];

    instance.isActive = json["isActive"];
    instance.token = json["token"];
    return instance;
  }
}