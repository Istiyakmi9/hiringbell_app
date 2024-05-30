import 'package:hiringbell/models/constants.dart';
import 'package:hiringbell/models/files.dart';

class Posts {
  int? userPostId;
  String? shortDescription;
  String? completeDescription;
  String? fullName;
  List<FileDetail> files = [];
  String? profileImage;
  bool isLiked = false;
  bool isApplied = false;
  int postedBy;

  Posts({
    this.userPostId,
    this.fullName,
    this.completeDescription,
    this.shortDescription,
    this.profileImage,
    required this.files,
    this.isLiked = false,
    this.isApplied = false,
    required this.postedBy,
  });

  static List<FileDetail> convertToList(dynamic jsonFiles) {
    if (jsonFiles == null) {
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
        userPostId: json['userPostId'],
        shortDescription: json["shortDescription"] ?? Constants.empty,
        completeDescription: json["completeDescription"] ?? Constants.empty,
        fullName: json["fullName"] ?? Constants.empty,
        profileImage: Constants.empty,
        files: convertToList(json["files"] ?? []),
        isLiked: json["isLiked"] ?? false,
        isApplied: json["isApplied"] ?? false,
        postedBy: json["postedBy"] ?? 0);
  }
  Map<String, dynamic> toJson() {
    return {
      'userPostId': userPostId,
      'shortDescription': shortDescription,
      'completeDescription': completeDescription,
      'fullName': fullName,
      'files': files.map((file) => FileDetail.toJson(file)).toList(),
      'profileImage': profileImage,
      'isLiked': isLiked,
      'isApplied': isApplied,
      'postedBy': postedBy,
    };
  }
}
