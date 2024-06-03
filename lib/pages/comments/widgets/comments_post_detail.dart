import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiringbell/pages/comments/comments_controller.dart';
import 'package:hiringbell/pages/view_post/view_post_controller.dart';
import 'package:hiringbell/pages/view_post/widgets/publisher_detail.dart';

class CommentsPostDetail extends GetView<CommentsController> {
  CommentsPostDetail({super.key});

  var viewController = Get.put(ViewPostController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PublisherDetail(),
        const SizedBox(
          height: 4,
        ),
        Text(viewController.getTitleSubDesc()),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * .8,
          child: Text(
            viewController.postsDetail!.completeDescription!,
            overflow: TextOverflow.ellipsis,
            maxLines: 1, // Limits the text to a single line
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
