import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiringbell/models/constants.dart';
import 'package:hiringbell/pages/common/button/bt_button.dart';
import 'package:hiringbell/pages/view_apply_post/view_apply_post_controller.dart';

class SaveSubmitButton extends GetView<ViewPostController> {
  const SaveSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BtButton.fullWidth(
            title: "Cancel",
            addHGap: 5,
            onClick: () {
              Get.back();
            },
          ),
          Obx(
            () => BtButton.fullWidthSubmit(
              title: controller.isApplying.value ? "Applying..." : "Apply now",
              addHGap: 5,
              onClick: () {
                debugPrint("Applied");
                controller.applyForJob();
              },
            ),
          ),
        ],
      ),
    );
  }
}
