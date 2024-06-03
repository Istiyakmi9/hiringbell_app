import 'package:flutter/material.dart';

class RecordingTimer extends StatefulWidget {
  const RecordingTimer({super.key});

  @override
  State<RecordingTimer> createState() => _RecordingTimerState();
}

class _RecordingTimerState extends State<RecordingTimer> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          width: 10,
        ),
        Text(
          "00:00",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
