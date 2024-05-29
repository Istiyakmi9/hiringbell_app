class PushNotificationMessage {
  int categoryId = 0;
  int postId = 0;
  String? message;

  PushNotificationMessage({
    required this.categoryId,
    required this.postId,
    required this.message,
  });

  factory PushNotificationMessage.fromMap(Map<String, dynamic> map) {
    return PushNotificationMessage(
        categoryId: map['categoryId'],
        postId: map['postId'],
        message: map['message']
    );
  }
}
