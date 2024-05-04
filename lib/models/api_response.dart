class ApiResponse {
  String? authenticationToken;
  dynamic responseBody;
  int httpStatusCode = 200;
  String? httpStatusMessage;

  ApiResponse({
    required this.authenticationToken,
    required this.responseBody,
    required this.httpStatusCode,
    required this.httpStatusMessage,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      authenticationToken: json['AuthenticationToken'] ?? "",
      responseBody: json['ResponseBody'] ?? <String, dynamic>{},
      httpStatusCode: json['HttpStatusCode'],
      httpStatusMessage: json['HttpStatusMessage'],
    );
  }
}
