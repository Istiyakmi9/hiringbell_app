import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiringbell/pages/login/login_controller.dart';
import 'package:hiringbell/pages/login/widgets/login_form.dart';

class LoginIndexPage extends GetView<LoginController> {
  const LoginIndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.isLoading.isTrue
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                    child: Image.asset(
                      "assets/bg1.jpeg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const LoginForm(),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Text(
                          "Need help!",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                          "By continuing, you agree with our terms & condition"),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text("Version: 1.0.5"),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
