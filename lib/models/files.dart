class FileDetail {
  int? fileDetailId;
  String? filePath;

  FileDetail({
    this.fileDetailId,
    this.filePath
  });

  factory FileDetail.fromJson(dynamic file) {
    return FileDetail(
      fileDetailId: file["FileDetailId"],
      filePath: file["FilePath"],
    );
  }
}