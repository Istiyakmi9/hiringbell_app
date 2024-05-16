import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hiringbell/pages/job_post/job_post_controller.dart';
import 'package:hiringbell/pages/job_post/widget/basic_detail.dart';

class JobForm extends StatefulWidget {
  const JobForm({super.key});

  @override
  State<JobForm> createState() => _JobFormState();
}

class _JobFormState extends State<JobForm> {
  var controller = Get.put(JobPostController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade50,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      width: double.infinity,
      child: Form(
        key: controller.formKey,
        child: Column(
          children: [
            const Text("Basic detail"),
            BasicDetail(),
          ],
        ),
      ),
    );
  }
}
