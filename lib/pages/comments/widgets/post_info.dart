import 'package:flutter/material.dart';
import 'package:hiringbell/pages/comments/widgets/comments_post_detail.dart';
import 'package:hiringbell/pages/view_post/widgets/post_image.dart';

class PostInfo extends StatelessWidget {
  const PostInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 12,
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          color: Colors.white,
          child: CommentsPostDetail(),
        ),
        Container(
          color: Colors.white,
          child: PostImage(),
        ),
        // const Comments(),
      ],
    );
  }
}
