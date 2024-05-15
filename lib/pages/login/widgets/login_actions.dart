import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiringbell/pages/login/login_controller.dart';

class LoginActions extends StatelessWidget {
  const LoginActions({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<LoginController>(
      init: LoginController(),
      builder: (login) => ElevatedButton.icon(
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(
              vertical: 10,
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            Theme.of(context).colorScheme.primary,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              side: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 0,
              ),
            ),
          ),
        ),
        onPressed: () {
          login.onSubmitted();
        },
        label: login.isSubmitted.value
            ? const Text(
                "Please wait...",
                style: TextStyle(color: Colors.white),
              )
            : const Text(
                "Sign in",
                style: TextStyle(color: Colors.white),
              ),
        icon: login.isSubmitted.value
            ? SizedBox.fromSize(
                size: const Size(20, 20),
                child: const CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : const Icon(
                Icons.rocket_launch_rounded,
                color: Colors.white,
              ),
      ),
    );
  }
}
