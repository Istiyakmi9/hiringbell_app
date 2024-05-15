import 'package:flutter/material.dart';
import 'package:hiringbell/pages/job_post/widget/job_form.dart';

class JobPostPage extends StatefulWidget {
  const JobPostPage({super.key});

  @override
  State<JobPostPage> createState() => _JobPostPageState();
}

class _JobPostPageState extends State<JobPostPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    debugPrint("Loading Job post page");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0.0,
        title: const Text("Post a new job"),
      ),
      body: const JobForm(),
    );
  }
}
