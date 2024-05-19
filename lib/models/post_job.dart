import 'package:hiringbell/models/files.dart';

class JobPost {
  int userPostId = 0;
  String? shortDescription = "test";
  int categoryTypeId = 0;
  int postedBy = 0;
  DateTime? postedOn;
  FileDetail? fileDetail;
  List<FileDetail>? files = [];
  int jobCategoryId = 1;
  int jobRequirementId = 0;
  String? requiredShortDesc;
  String? completeDescription;
  int jobTypeId = 0;
  int clientId = 0;
  int? agentId = 0;
  int? partnerId = 0;
  int shiftId = 0;
  bool? isHRAAllowance = false;
  double? hraAllowanceAmount = 0.0;
  bool? isTravelAllowance = false;
  double? travelAllowanceAmount = 0.0;
  bool? isFoodAllowance = false;
  double? foodAllowanceAmount = 0.0;
  bool? isForeignReturnCompulsory = false;
  int minimunDaysRequired = 0;
  int? certificateRequiredId = 0;
  double minimunCTC = 0;
  double maximunCTC = 0;
  bool isOTIncluded = false;
  int? maxOTHours = 0;
  double? bonus = 0.0;
  int countryId = 0;
  int minAgeLimit = 0;
  int maxAgeLimit = 0;
  int noOfPosts = 0;
  int salaryCurrency = 0;
  int? contractPeriodInMonths = 0;
  int createdBy = 0;
  int? updatedBy = 0;
  DateTime? createdOn;
  DateTime? updatedOn;
  int dailyWorkingHours = 0;
  int visaType = 0;
  bool isMedicalInsuranceProvide = false;
  int overseasExperience = 0;
  int localExperience = 0;
  bool? isMon;
  bool? isTue;
  bool? isThu;
  bool? isWed;
  bool? isFri;
  bool? isSat;
  bool? isSun;

  JobPost.withoutParam();

  JobPost({
    required this.userPostId,
    this.shortDescription,
    required this.categoryTypeId,
    required this.postedBy,
    this.postedOn,
    this.fileDetail,
    this.files,
    required this.jobCategoryId,
    required this.jobRequirementId,
    this.requiredShortDesc,
    this.completeDescription,
    required this.jobTypeId,
    required this.clientId,
    this.agentId,
    this.partnerId,
    required this.shiftId,
    this.isHRAAllowance,
    this.hraAllowanceAmount,
    this.isTravelAllowance,
    this.travelAllowanceAmount,
    this.isFoodAllowance,
    this.foodAllowanceAmount,
    this.isForeignReturnCompulsory,
    required this.minimunDaysRequired,
    this.certificateRequiredId,
    required this.minimunCTC,
    required this.maximunCTC,
    required this.isOTIncluded,
    this.maxOTHours,
    this.bonus,
    required this.countryId,
    required this.minAgeLimit,
    required this.maxAgeLimit,
    required this.noOfPosts,
    required this.salaryCurrency,
    this.contractPeriodInMonths,
    required this.createdBy,
    this.updatedBy,
    this.createdOn,
    this.updatedOn,
    required this.dailyWorkingHours,
    required this.visaType,
    required this.isMedicalInsuranceProvide,
    required this.overseasExperience,
    required this.localExperience,
    this.isMon,
    this.isTue,
    this.isThu,
    this.isWed,
    this.isFri,
    this.isSat,
    this.isSun,
  });

  static List<FileDetail> convertToList(dynamic jsonFiles) {
    List<dynamic> dFiles = jsonFiles;
    List<FileDetail> files = [];
    for (var i = 0; i < dFiles.length; i++) {
      files.add(FileDetail.fromJson(dFiles[i]));
    }

    return files;
  }

  factory JobPost.fromJson(dynamic json) {
    return JobPost(
      userPostId: json['userPostId'],
      shortDescription: json['shortDescription'],
      categoryTypeId: json['categoryTypeId'],
      postedBy: json['postedBy'],
      postedOn: json['postedOn'],
      fileDetail: json['fileDetail'],
      files: json['files'] ?? convertToList(json['files']),
      jobCategoryId: json['jobCategoryId'],
      jobRequirementId: json['jobRequirementId'],
      requiredShortDesc: json['requiredShortDesc'],
      completeDescription: json['completeDescription'],
      jobTypeId: json['jobTypeId'],
      clientId: json['clientId'],
      agentId: json['agentId'],
      partnerId: json['partnerId'],
      shiftId: json['shiftId'],
      isHRAAllowance: json['isHRAAllowance'],
      hraAllowanceAmount: json['hraAllowanceAmount'],
      isTravelAllowance: json['isTravelAllowance'],
      travelAllowanceAmount: json['travelAllowanceAmount'],
      isFoodAllowance: json['isFoodAllowance'],
      foodAllowanceAmount: json['foodAllowanceAmount'],
      isForeignReturnCompulsory: json['isForeignReturnCompulsory'],
      minimunDaysRequired: json['minimunDaysRequired'],
      certificateRequiredId: json['certificateRequiredId'],
      minimunCTC: json['minimunCTC'],
      maximunCTC: json['maximunCTC'],
      isOTIncluded: json['isOTIncluded'],
      maxOTHours: json['maxOTHours'],
      bonus: json['bonus'],
      countryId: json['countryId'],
      minAgeLimit: json['minAgeLimit'],
      maxAgeLimit: json['maxAgeLimit'],
      noOfPosts: json['noOfPosts'],
      salaryCurrency: json['salaryCurrency'],
      contractPeriodInMonths: json['contractPeriodInMonths'],
      createdBy: json['createdBy'],
      updatedBy: json['updatedBy'],
      createdOn: json['createdOn'],
      updatedOn: json['updatedOn'],
      dailyWorkingHours: json['dailyWorkingHours'],
      visaType: json['visaType'],
      isMedicalInsuranceProvide: json['isMedicalInsuranceProvide'],
      overseasExperience: json['overseasExperience'],
      localExperience: json['localExperience'],
      isMon: json['isMon'],
      isTue: json['isTue'],
      isThu: json['isThu'],
      isWed: json['isWed'],
      isFri: json['isFri'],
      isSat: json['isSat'],
      isSun: json['isSun'],
    );
  }
}
