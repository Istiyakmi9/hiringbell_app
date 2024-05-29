import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final bool withScaffold;

  const ErrorPage({super.key, required this.withScaffold});

  @override
  Widget build(BuildContext context) {
    return withScaffold
        ? const Scaffold(
            body: Center(
              child: Text("Error on loading page detail"),
            ),
          )
        : const Center(
            child: Text("Error on loading page detail"),
          );
  }
}
