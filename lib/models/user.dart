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
    instance.address = json["Address"];
    instance.city = json["City"];
    instance.createdOn = toDateTime(json["CreatedOn"]);
    instance.email = json["Email"];
    instance.firstName = json["FirstName"];
    instance.lastName = json["LastName"];
    instance.mobile = json["Mobile"] ?? "";
    instance.jobCategoryId = json["JobCategoryId"];
    instance.state = json["State"] ?? "";
    instance.userId = json["UserId"];

    List<int> categoryIds = (jsonDecode(json["CategoryTypeIds"]) as List<dynamic>).cast<int>();
    instance.categoryTypeIds = categoryIds ?? [];

    var locationIds = (jsonDecode(json["JobLocationIds"]) as List<dynamic>).cast<int>();
    instance.jobLocationIds = locationIds ?? [];

    instance.isActive = json["IsActive"];
    instance.token = json["Token"];
    return instance;
  }
}