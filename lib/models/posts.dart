import 'dart:convert';

import 'package:hiringbell/models/constants.dart';

class Posts {
  String? shortDescription;
  String? completeDescription;
  String? fullName;
  List<String> files = [];

  Posts({
    this.fullName,
    this.completeDescription,
    this.shortDescription,
    required this.files,
  });

  static List<String> convertToList(dynamic jsonFiles) {
    var dFiles = jsonDecode(jsonFiles);
    List<String> files = [];
    for(var i = 0; i < dFiles.length; i++) {
      files.add(dFiles[i].toString());
    }

    return files;
  }

  factory Posts.fromJson(dynamic json) {
    return Posts(
      shortDescription: json["ShortDescription"] ?? Constants.empty,
      completeDescription: json["CompleteDescription"] ?? Constants.empty,
      fullName: json["FullName"] ?? Constants.empty,
      files: convertToList(json["Files"])
    );
  }
}
