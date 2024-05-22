import 'dart:convert';

import 'package:hiringbell/models/constants.dart';
import 'package:hiringbell/models/files.dart';

class Posts {
  String? shortDescription;
  String? completeDescription;
  String? fullName;
  List<FileDetail> files = [];
  String? profileImage;

  Posts({
    this.fullName,
    this.completeDescription,
    this.shortDescription,
    this.profileImage,
    required this.files,
  });

  static List<FileDetail> convertToList(dynamic jsonFiles) {
    if(jsonFiles == null){
      return [];
    }

    List<dynamic> dFiles = jsonFiles;
    List<FileDetail> files = [];
    for (var i = 0; i < dFiles.length; i++) {
      files.add(FileDetail.fromJson(dFiles[i]));
    }

    return files;
  }

  factory Posts.fromJson(dynamic json) {
    return Posts(
        shortDescription: json["shortDescription"] ?? Constants.empty,
        completeDescription: json["completeDescription"] ?? Constants.empty,
        fullName: json["fullName"] ?? Constants.empty,
        profileImage: Constants.empty,
        files: convertToList(json["files"]));
  }
}
