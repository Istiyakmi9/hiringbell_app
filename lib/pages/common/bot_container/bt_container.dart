import 'package:flutter/material.dart';
import 'package:hiringbell/pages/common/bot_container/widgets/styled_container.dart';

class BtContainer extends StatelessWidget {
  final Widget child;
  final Color color;
  final Color borderColor;
  final int type;

  const BtContainer({
    super.key,
    required this.child,
    this.type = ContainerType.vSpace,
    this.color = Colors.white,
    this.borderColor = Colors.white,
  });

  BoxDecoration getDefaultDecoration() {
    return BoxDecoration(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: getDefaultDecoration(),
      child: type == ContainerType.hSpace
          ? Stack(
              children: [
                StyledContainer(
                  type: type,
                  color: color,
                  borderColor: borderColor,
                  child: child,
                ),
              ],
            )
          : Stack(
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

class ContainerType {
  static const int space = 1;
  static const int topSpace = 2;
  static const int bottomSpace = 3;
  static const int hSpace = 2;
  static const int vSpace = 2;
}
