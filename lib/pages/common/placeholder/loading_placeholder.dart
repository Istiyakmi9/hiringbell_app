import 'dart:async';

import 'package:flutter/material.dart';

class LoadingPlaceholder extends StatefulWidget {
  final Widget child;
  Color? baseColor;
  Color? highlightColor;
  final Gradient? gradient;
  final double period;
  final bool enabled;

  LoadingPlaceholder({
    super.key,
    required this.child,
    this.baseColor,
    this.highlightColor,
    this.gradient,
    this.period = 1500, // milliseconds
    this.enabled = true,
  });

  @override
  State<LoadingPlaceholder> createState() => _LoadingPlaceholderState();
}

class _LoadingPlaceholderState extends State<LoadingPlaceholder> {
  double _value = 0.0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    widget.baseColor ??= Colors.grey[700];
    widget.highlightColor ??= Colors.grey[500]!;

    if (widget.enabled) {
      _timer = Timer.periodic(Duration(milliseconds: widget.period.round()), (_) {
        setState(() {
          _value = (_value + 0.1) % 1.0;
        });
      });
    }
  }

  @override
  void didUpdateWidget(covariant LoadingPlaceholder oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.enabled != oldWidget.enabled) {
      if (widget.enabled) {
        _timer = Timer.periodic(Duration(milliseconds: widget.period.round()), (_) {
          setState(() {
            _value = (_value + 0.1) % 1.0;
          });
        });
      } else {
        _timer?.cancel();
        _timer = null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = widget.gradient?.colors ?? [widget.baseColor!, widget.highlightColor!];
    final List<double> stops = widget.gradient?.stops ?? [0.0, 1.0];

    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0), // Optional rounded corners
      child: Stack(
        children: [
          widget.child,
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: colors.map((color) => color.withOpacity(_value)).toList(),
                  stops: stops,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
