import 'package:flutter/material.dart';

class FeatureDetail extends StatelessWidget {
  final Widget titleWidget;
  final IconData icon;


  const FeatureDetail({
    super.key,
    required this.titleWidget,
    this.icon = Icons.check_circle_outline,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey,),
          const SizedBox(
            width: 10,
          ),
          titleWidget,
        ],
      ),
    );
  }
}
