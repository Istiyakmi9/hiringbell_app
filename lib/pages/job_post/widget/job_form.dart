import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiringbell/pages/job_post/job_post_controller.dart';
import 'package:hiringbell/pages/job_post/widget/action_card.dart';
import 'package:hiringbell/pages/job_post/widget/basic_detail.dart';
import 'package:hiringbell/pages/job_post/widget/other_detail.dart';
import 'package:hiringbell/pages/job_post/widget/salary_detail.dart';
import 'package:hiringbell/pages/job_post/widget/upload_files.dart';
import 'package:hiringbell/pages/job_post/widget/work_detail.dart';

class JobForm extends GetView<JobPostController> {
  const JobForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey.shade50,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        width: double.infinity,
        child: Form(
          key: controller.formKey,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BasicDetail(),
              SalaryDetail(),
              WorkDetail(),
              OtherDetail(),
              UploadFiles(),
              ActionCard(),
            ],
          ),
        ),
      ),
    );
  }
}
