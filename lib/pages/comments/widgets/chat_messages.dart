import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiringbell/pages/comments/comments_controller.dart';

class ChatMessages extends GetView<CommentsController> {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: const EdgeInsets.only(
          top: 10,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 10,
        ),
        child: controller.chatMessage.value.isEmpty
            ? Container()
            : ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.chatMessage.value.length,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: 200,
                        margin: const EdgeInsets.only(
                          top: 12,
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey.shade200,
                                    border: Border.all(
                                      color: Colors.orange, // Border color
                                      width: 1.0, // Border width
                                    ),
                                  ),
                                  child: const CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 20,
                                    child: Icon(
                                      Icons.perm_identity_rounded,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: controller.playRecording,
                                  icon: const Icon(Icons.play_arrow),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Image.asset(
                                "assets/audio-file.gif",
                                width: 100,
                                height: 50,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
      ),
    );
  }
}
