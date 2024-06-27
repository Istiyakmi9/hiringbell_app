class Education {
  int educationId;
  String educationName;

  Education({
    required this.educationId,
    required this.educationName,
  });

  factory Education.fromJson(Map<String, dynamic> json) {
    return Education(
      educationId: json['educationId'],
      educationName: json['educationName'],
    );
  }

  // Convert a Education object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'educationId': educationId,
      'educationName': educationName,
    };
  }

  @override
  String toString() {
    return educationName;
  }

  static List<Education> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Education.fromJson(json)).toList();
  }

  static List<Map<String, dynamic>> toJsonList(List<Education> jobTypes) {
    return jobTypes.map((edu) => edu.toJson()).toList();
  }
}
