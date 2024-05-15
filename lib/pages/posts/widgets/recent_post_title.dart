import 'package:flutter/material.dart';

class RecentPostTitle extends StatelessWidget {
  const RecentPostTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      color: Colors.white,
      width: double.infinity,
      child: const Text(
        "Your recent posts",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
