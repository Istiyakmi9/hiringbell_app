import 'package:flutter/material.dart';

class BtButton extends StatelessWidget {
  final Color bgColor;
  final double roundedValue;
  final String title;
  final Color? textColor;
  final double width;
  final double addHGap;
  final Function()? onClick;

  const BtButton({
    super.key,
    required this.title,
    required this.onClick,
    this.bgColor = Colors.white,
    this.roundedValue = 6,
    this.width = 0,
    this.addHGap = 0,
    this.textColor = Colors.black87,
  });

  const BtButton.submit({
    super.key,
    required this.title,
    required this.onClick,
    this.bgColor = Colors.redAccent,
    this.roundedValue = 6,
    this.width = 0,
    this.addHGap = 0,
    this.textColor = Colors.white,
  });

  const BtButton.fullWidth({
    super.key,
    required this.title,
    required this.onClick,
    this.bgColor = Colors.white,
    this.roundedValue = 6,
    this.width = double.infinity,
    this.addHGap = 0,
    this.textColor = Colors.black87,
  });

  const BtButton.fullWidthSubmit({
    super.key,
    required this.title,
    required this.onClick,
    this.bgColor = Colors.redAccent,
    this.roundedValue = 6,
    this.width = double.infinity,
    this.addHGap = 0,
    this.textColor = Colors.white,
  });

  WidgetStateProperty<RoundedRectangleBorder?> getShape() {
    return WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(roundedValue),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: addHGap),
        width: width,
        child: ElevatedButton(
          style: ButtonStyle(
            // Background color for all states (normal, pressed, focused, etc.)
            backgroundColor: WidgetStateProperty.all(bgColor),

            // Text color for all states
            foregroundColor: WidgetStateProperty.all(textColor),

            // Shape of the button
            shape: getShape(),

            // Padding around the button content
            padding: WidgetStateProperty.all(const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            )),

            // Elevation of the button
            elevation: WidgetStateProperty.all(5.0),

            // Optional: Customize different states
            // For example, change the background color on press
            overlayColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.blue[700];
              }
              return null;
            }),
          ),
          onPressed: onClick,
          child: Text(title),
        ),
      ),
    );
  }
}
