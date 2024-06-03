import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final bool withScaffold;

  const ErrorPage({super.key, this.withScaffold = true});

  @override
  Widget build(BuildContext context) {
    return withScaffold
        ? const Scaffold(
            body: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 70,
                ),
                child: Text(
                  "Something went wrong. Please try again later",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
        : const Center(
            child: Text("Error on loading page detail"),
          );
  }
}
