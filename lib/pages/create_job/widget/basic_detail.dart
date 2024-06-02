import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiringbell/models/country.dart';
import 'package:hiringbell/models/job_type.dart';
import 'package:hiringbell/models/key_value_items.dart';
import 'package:hiringbell/pages/common/bt_text_form_field/bt_text_form_field.dart';
import 'package:hiringbell/pages/common/imulti_select/imulti_select_dropdown.dart';
import 'package:hiringbell/pages/create_job/job_post_controller.dart';

class BasicDetail extends GetView<JobPostController> {
  const BasicDetail({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.only(
            left: 4,
          ),
          child: Text(
            "Post Basic Information",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Card(
          color: Colors.white,
          elevation: 6,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Job Title"),
                      BTTextFormField(
                        hintText: "Enter email or mobile no#",
                        initialValue: controller.jobPost.shortDescription,
                        onChanged: (value) {
                          controller.jobPost.shortDescription = value;
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Description"),
                      BTTextFormField(
                        maxLines: null,
                        minLines: 4,
                        keyboardType: TextInputType.multiline,
                        hintText: "Enter Description",
                        initialValue: controller.jobPost.completeDescription,
                        onChanged: (value) {
                          controller.jobPost.completeDescription = value;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  title: const Text(
                    // 'Category Type',
                    'Job Type',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  trailing: SizedBox(
                    width: 200,
                    child: IMultiSelectDropdown<JobType>(
                      initialItem: controller.listJobType.firstWhereOrNull(
                          (c) => c.jobTypeId == controller.jobPost.jobTypeId),
                      items: controller.listJobType,
                      hintText: "Select Job Type",
                      onChanged: (category) {
                        controller.jobPost.jobTypeId = category.jobTypeId;
                      },
                      decoration: IMultiSelectDropdownDecoration(
                          closedFillColor: Colors.grey.shade50),
                    ),
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Country',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  trailing: SizedBox(
                    width: 200,
                    child: IMultiSelectDropdown<Country>(
                      initialItem: controller.listCountry.firstWhereOrNull(
                          (c) => c.id == controller.jobPost.countryId),
                      items: controller.listCountry,
                      onChanged: (country) {
                        controller.jobPost.countryId = country.id;
                      },
                      hintText: "Select country",
                      decoration: IMultiSelectDropdownDecoration(
                          closedFillColor: Colors.grey.shade50),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("All field are mandatory in this section"),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
