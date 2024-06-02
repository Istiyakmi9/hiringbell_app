import 'package:hiringbell/models/constants.dart';
import 'package:hiringbell/utilities/util.dart';

class JobType {
  final int jobTypeId;
  final String? jobTypeName;
  final String? jobDescription;
  final int? categoryId;
  final int? createdBy;
  final int? updatedBy;
  final DateTime? createdOn;
  final DateTime? updatedOn;

  JobType({
    required this.jobTypeId,
    this.jobTypeName,
    this.jobDescription,
    this.categoryId,
    this.createdBy,
    this.updatedBy,
    this.createdOn,
    this.updatedOn,
  });

  factory JobType.fromJson(Map<String, dynamic> json) {
    return JobType(
      jobTypeId: json['jobTypeId'],
      jobTypeName: json['jobTypeName'],
      jobDescription: json['jobDescription'],
      categoryId: json['categoryId'],
      createdBy: json['createdBy'],
      updatedBy: json['updatedBy'],
      createdOn: Util.convertToDateTime(json['createdOn']),
      updatedOn: Util.convertToDateTime(json['updatedOn']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jobTypeId': jobTypeId,
      'jobTypeName': jobTypeName,
      'jobDescription': jobDescription,
      'categoryId': categoryId,
      'createdBy': createdBy,
      'updatedBy': updatedBy,
      'createdOn': createdOn?.toIso8601String(),
      'updatedOn': updatedOn?.toIso8601String(),
    };
  }

  @override
  String toString() {
    return jobTypeName ?? Constants.empty;
  }

  static List<JobType> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => JobType.fromJson(json)).toList();
  }

  static List<Map<String, dynamic>> toJsonList(List<JobType> jobTypes) {
    return jobTypes.map((jobType) => jobType.toJson()).toList();
  }
}
