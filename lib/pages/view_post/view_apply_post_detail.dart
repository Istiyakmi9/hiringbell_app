import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiringbell/pages/common/error_page/error_page.dart';
import 'package:hiringbell/pages/home/home_controller.dart';
import 'package:hiringbell/pages/view_post/view_post_controller.dart';
import 'package:hiringbell/pages/view_post/widgets/post_detail.dart';
import 'package:hiringbell/pages/view_post/widgets/save_submit_button.dart';

class ViewApplyPostDetail extends StatefulWidget {
  const ViewApplyPostDetail({super.key});

  @override
  State<ViewApplyPostDetail> createState() => _ViewApplyPostDetailState();
}

class _ViewApplyPostDetailState extends State<ViewApplyPostDetail> {
  var controller = Get.put(ViewPostController());
  var home = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.isLoading.value = true;
    controller.loadPostDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0.0,
        title: const Text("Post detail"),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : controller.postsDetail == null
                ? const ErrorPage()
                : Column(
                    children: [
                      Expanded(
                        flex: controller.postsDetail!.jobAppliedOn != null
                            ? 10
                            : 9,
                        child: const SingleChildScrollView(
                          child: PostDetail(),
                        ),
                      ),
                      if (controller.postsDetail!.jobAppliedOn == null)
                        const Flexible(
                          flex: 1,
                          child: SaveSubmitButton(),
                        ),
                    ],
                  ),
      ),
    );
  }
}
