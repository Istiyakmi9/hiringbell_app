import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hiringbell/pages/common/bordered_card/fancy_card.dart';
import 'package:hiringbell/pages/job_post/job_post_controller.dart';

class DaysCard extends StatefulWidget {
  final String label;
  final int index;
  bool flag;

  DaysCard({
    super.key,
    required this.label,
    required this.index,
    required this.flag,
  });

  @override
  State<DaysCard> createState() => _DaysCardState();
}

class _DaysCardState extends State<DaysCard> {
  var controller = Get.put(JobPostController());

  updateCard(bool f) {
    setState(() {
      widget.flag = f;
    });
  }

  Color getBorderColors() {
    if (widget.flag) {
      return Colors.green;
    }

    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return FancyCard(
      color: widget.flag ? Colors.green : Colors.red,
      borderColor: Colors.grey.shade300,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                widget.flag
                    ? const Icon(
                        Icons.workspace_premium_outlined,
                        color: Colors.orange,
                      )
                    : Icon(
                        Icons.card_giftcard,
                        color: Colors.grey.shade400,
                      ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  widget.label,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                widget.flag
                    ? const Text(
                        "(Working day)",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      )
                    : const Text(
                        "(Week off)",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
              ],
            ),
            Switch(
              // This bool value toggles the switch.
              value: widget.flag,
              activeColor: Colors.blueAccent,
              onChanged: (bool value) {
                debugPrint("$value");
                controller.updateWeekdaysStatus(widget.index);
                updateCard(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
