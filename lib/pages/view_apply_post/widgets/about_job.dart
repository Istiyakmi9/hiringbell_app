import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiringbell/pages/common/bot_container/bt_container.dart';
import 'package:hiringbell/pages/view_apply_post/view_apply_post_controller.dart';
import 'package:hiringbell/pages/view_apply_post/widgets/feature_detail.dart';
import 'package:hiringbell/pages/view_apply_post/widgets/publisher_detail.dart';
import 'package:hiringbell/pages/view_apply_post/widgets/save_submit_button.dart';

class AboutJob extends GetView<ViewPostController> {
  const AboutJob({super.key});

  @override
  Widget build(BuildContext context) {
    return BtContainer(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "About the Job",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text("${controller.postsDetail!.completeDescription}"),
          const SizedBox(
            height: 16,
          ),
          FeatureDetail(
            // icon: Icons.check_circle,
            titleWidget: Text(
              "${controller.postsDetail!.maxOTHours} hrs max overtime allowed",
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          FeatureDetail(
            //icon: Icons.check,
            titleWidget: Text(
              "${controller.postsDetail!.minAgeLimit} - ${controller.postsDetail!.maxAgeLimit} years age limit",
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          if (controller.postsDetail!.isForeignReturnCompulsory != null &&
              controller.postsDetail!.isForeignReturnCompulsory!)
            FeatureDetail(
              //icon: Icons.check_circle_outline,
              titleWidget: Wrap(
                children: [
                  const Text(
                    "Foreign return: ",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Text(
                    "Compulsory",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      backgroundColor: Color(0xFFE1E399),
                    ),
                  ),
                  Text(
                    " - experience: ${(controller.postsDetail!.minimumDaysRequired / 365).toStringAsFixed(2)} yrs",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          if (controller.postsDetail!.overseasExperience > 0 ||
              controller.postsDetail!.localExperience > 0)
            FeatureDetail(
              //icon: Icons.check_box_outlined,
              titleWidget: Text(
                "Experience - overseas: ${controller.postsDetail!.overseasExperience} days - local: ${controller.postsDetail!.localExperience}",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          FeatureDetail(
            //icon: CupertinoIcons.briefcase,
            titleWidget: Text(
              "Visa type - ${controller.postsDetail!.visaType == 2 ? "work permit": "tourist"}",
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          if (controller.postsDetail!.bonus != null &&
              controller.postsDetail!.bonus! > 0)
            FeatureDetail(
              //icon: CupertinoIcons.briefcase,
              titleWidget: Text(
                "Bonus ${controller.postsDetail!.bonus!}: ",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          if (controller.postsDetail!.contractPeriodInMonths != null &&
              controller.postsDetail!.contractPeriodInMonths! > 0)
            FeatureDetail(
              //icon: CupertinoIcons.briefcase,
              titleWidget: Text(
                "Contract period ${controller.postsDetail!.contractPeriodInMonths!} (months)",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          FeatureDetail(
            //icon: CupertinoIcons.briefcase,
            titleWidget: Text(
              "Working hours: ${controller.postsDetail!.dailyWorkingHours} hrs",
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          FeatureDetail(
            //icon: CupertinoIcons.briefcase,
            titleWidget: Text(
              "HRA: ${controller.postsDetail!.hRAAllowanceAmount}",
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          FeatureDetail(
            //icon: CupertinoIcons.briefcase,
            titleWidget: Text(
              "Food allowance: ${controller.postsDetail!.foodAllowanceAmount}",
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          FeatureDetail(
            //icon: CupertinoIcons.briefcase,
            titleWidget: Text(
              "Travel allowance: ${controller.postsDetail!.travelAllowanceAmount}",
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
