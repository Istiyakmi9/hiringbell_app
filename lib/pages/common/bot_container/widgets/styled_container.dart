import 'package:flutter/material.dart';

class StyledContainer extends StatelessWidget {
  final int type;
  final Widget child;
  final Color color;
  final Color borderColor;

  const StyledContainer({
    super.key,
    required this.child,
    required this.type,
    required this.color,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case 1:
        return Container(
          margin: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          color: borderColor,
          child: child,
        );
      default:
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          margin: const EdgeInsets.only(
            bottom: 12,
          ),
          color: color,
          child: child,
        );
    }
  }
}
