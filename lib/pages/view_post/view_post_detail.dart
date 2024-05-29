import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiringbell/pages/view_post/view_post_controller.dart';

class ViewPostDetail extends StatelessWidget {
  final int postId;

  ViewPostDetail({super.key, required this.postId});

  var controller = Get.put(ViewPostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0.0,
        title: const Text("Post detail"),
      ),
      body: Center(
        child: Text("Displaying post: $postId"),
      ),
    );
  }
}
