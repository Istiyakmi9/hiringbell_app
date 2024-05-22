import 'package:flutter/material.dart';

class FancyCard extends StatelessWidget {
  final Widget child;
  final Color color;
  final Color borderColor;

  const FancyCard({
    super.key,
    required this.child,
    required this.color,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 4,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: borderColor,
          ),
          bottom: BorderSide(
            color: borderColor,
          ),
          right: BorderSide(
            color: borderColor,
          ),
        ),
        borderRadius:
            BorderRadius.circular(8.0), // Add some rounded corners (optional)
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0.0,
            top: 0.0,
            bottom: 0.0,
            width: 4.0,
            child: Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(9),
                  topLeft: Radius.circular(9),
                ),
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
