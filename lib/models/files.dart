class Files {
  int? fileDetailId;
  String? filePath;

  Files({
    this.fileDetailId,
    this.filePath
  });

  factory Files.fromJson(dynamic file) {
    return Files(
      fileDetailId: file["FileDetailId"],
      filePath: file["FilePath"],
    );
  }
}