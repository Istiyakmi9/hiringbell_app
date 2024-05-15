import 'dart:convert';

import 'package:hiringbell/models/constants.dart';
import 'package:hiringbell/models/files.dart';

class Posts {
  String? shortDescription;
  String? completeDescription;
  String? fullName;
  List<Files> files = [];
  String? profileImage;

  Posts({
    this.fullName,
    this.completeDescription,
    this.shortDescription,
    this.profileImage,
    required this.files,
  });

  static List<Files> convertToList(dynamic jsonFiles) {
    List<dynamic> dFiles = jsonFiles;
    List<Files> files = [];
    for (var i = 0; i < dFiles.length; i++) {
      files.add(Files.fromJson(dFiles[i]));
    }

    return files;
  }

  factory Posts.fromJson(dynamic json) {
    return Posts(
        shortDescription: json["ShortDescription"] ?? Constants.empty,
        completeDescription: json["CompleteDescription"] ?? Constants.empty,
        fullName: json["FullName"] ?? Constants.empty,
        profileImage: Constants.empty,
        files: convertToList(json["Files"]));
  }
}
