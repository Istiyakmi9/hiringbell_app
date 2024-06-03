class FileDetail {
  int? fileDetailId;
  String? filePath;

  FileDetail({this.fileDetailId, this.filePath});

  static Map<String, dynamic> toJson(FileDetail fileDetail) {
    return {
      'fileDetailId': fileDetail.fileDetailId,
      'filePath': fileDetail.filePath,
    };
  }

  factory FileDetail.fromJson(dynamic file) {
    return FileDetail(
      fileDetailId: file["fileDetailId"],
      filePath: file["filePath"],
    );
  }
  static List<FileDetail> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => FileDetail.fromJson(json)).toList();
  }
}
