import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiringbell/pages/comments/comments_controller.dart';
import 'package:hiringbell/pages/comments/widgets/chat_input_section.dart';
import 'package:hiringbell/pages/comments/widgets/comments_chat.dart';
import 'package:hiringbell/pages/comments/widgets/post_info.dart';
import 'package:hiringbell/pages/common/error_page/error_page.dart';
import 'package:hiringbell/pages/view_apply_post/view_apply_post_controller.dart';
import 'package:hiringbell/pages/view_apply_post/widgets/post_detail.dart';

import '../home/home_controller.dart';
import '../view_apply_post/view_apply_post_controller.dart';

class CommentsPage extends StatefulWidget {
  const CommentsPage({super.key});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  var viewController = Get.put(ViewPostController());
  var controller = Get.put(CommentsController());

  var home = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewController.isLoading.value = true;
    viewController.loadPostDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0.0,
        title: const Text("Comments"),
      ),
      body: Obx(
        () => viewController.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : viewController.postsDetail == null
                ? const ErrorPage()
                : Stack(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .8,
                              child: const CommentsChat(),
                            ),
                          ],
                        ),
                      ),
                      const Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: ChatInputSection(),
                      ),
                    ],
                  ),
      ),
    );
  }
}
