import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiringbell/models/posts.dart';
import 'package:hiringbell/pages/create_job/job_post_controller.dart';
import 'package:hiringbell/pages/create_job/widget/job_form.dart';

class JobPostEditPage extends StatelessWidget {
  final Posts? existingPost;
  const JobPostEditPage({super.key, this.existingPost});

  Future<JobPostController> initializeController() async {
    var controller = JobPostController(jobPostId_: existingPost?.userPostId);
    await controller.onInitRefresh();
    return controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0.0,
        title: const Text("Edit a job"),
      ),
      body: JobForm(existingPost: existingPost),
    );
  }
}
