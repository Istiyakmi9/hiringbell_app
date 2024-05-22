import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hiringbell/models/key_value_items.dart';
import 'package:hiringbell/pages/common/imulti_select/imulti_select_dropdown.dart';
import 'package:hiringbell/pages/job_post/job_post_controller.dart';

class OtherDetail extends GetView<JobPostController> {
  const OtherDetail({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
            "Other information",
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
                const ListTile(
                  leading: Icon(Icons.calendar_today),
                  title: Text(
                    'Other important detail',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text('Age limit, insurance, # vacancy etc'),
                  trailing: Icon(Icons.more_vert),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  title: const Text(
                    'Medical insurance',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  trailing: SizedBox(
                    width: 200,
                    child: IMultiSelectDropdown<KeyValuePair>(
                      hintText: 'Select medical insurance',
                      items: <KeyValuePair>[
                        KeyValuePair(text: 'By company', value: 1),
                        KeyValuePair(text: 'No insurance', value: 2),
                      ],
                      decoration: IMultiSelectDropdownDecoration(
                        closedFillColor: Colors.grey.shade100,
                      ),
                      onChanged: (value) {
                        controller.jobPost.isMedicalInsuranceProvide =
                            value.value == 1 ? true : false;
                      },
                    ),
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Visa Type',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  trailing: SizedBox(
                    width: 200,
                    child: IMultiSelectDropdown<KeyValuePair>(
                      hintText: 'Select visa type',
                      items: <KeyValuePair>[
                        KeyValuePair(text: 'Tourist', value: 1),
                        KeyValuePair(text: 'Employment', value: 2),
                      ],
                      decoration: IMultiSelectDropdownDecoration(
                        closedFillColor: Colors.grey.shade100,
                      ),
                      onChanged: (value) {
                        controller.jobPost.visaType = value.value;
                      },
                    ),
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Job Type',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  trailing: SizedBox(
                    width: 200,
                    child: IMultiSelectDropdown<KeyValuePair>(
                      hintText: 'Select job type',
                      items: <KeyValuePair>[
                        KeyValuePair(text: 'Contractual', value: 1),
                        KeyValuePair(text: 'Permanent', value: 2),
                      ],
                      decoration: IMultiSelectDropdownDecoration(
                        closedFillColor: Colors.grey.shade100,
                      ),
                      onChanged: (value) {
                        controller.jobPost.jobTypeId = value.value;
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.0,
                      ),
                      child: Text("Age Limit"),
                    ),
                    ListTile(
                      title: const Text(
                        'Min Age',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      trailing: SizedBox(
                        width: 200,
                        child: IMultiSelectDropdown<int>(
                          hintText: 'Minimum age',
                          items: List.generate(30, (i) => i + 1),
                          decoration: IMultiSelectDropdownDecoration(
                            closedFillColor: Colors.grey.shade100,
                          ),
                          onChanged: (value) {
                            controller.jobPost.minAgeLimit = value;
                          },
                        ),
                      ),
                    ),
                    ListTile(
                      title: const Text(
                        'Max Age',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      trailing: SizedBox(
                        width: 200,
                        child: IMultiSelectDropdown<int>(
                          hintText: 'Maximum age',
                          items: List.generate(80, (i) => i + 1),
                          decoration: IMultiSelectDropdownDecoration(
                            closedFillColor: Colors.grey.shade100,
                          ),
                          onChanged: (value) {
                            controller.jobPost.maxAgeLimit = value;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    child: ExpansionPanelList(
                      dividerColor: Colors.grey.shade300,
                      children: [
                        ExpansionPanel(
                          headerBuilder: (context, isOpen) {
                            return const ListTile(
                              title: Text(
                                "Overtime detail",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              subtitle: Text(
                                "if overtime allowed then use this section to define overtime",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              leading: Icon(Icons.timelapse),
                            );
                          },
                          body: Padding(
                            padding: const EdgeInsets.only(
                              left: 15,
                              right: 15,
                              top: 6,
                              bottom: 16,
                            ),
                            child: SizedBox(
                              width: 250,
                              child: IMultiSelectDropdown<int>(
                                hintText: 'Overtime hours',
                                items:
                                    controller.generateRandomNumber(range: 6),
                                decoration: IMultiSelectDropdownDecoration(
                                  closedFillColor: Colors.grey.shade100,
                                ),
                                onChanged: (value) {
                                  controller.jobPost.maxOTHours = value;
                                },
                              ),
                            ),
                          ),
                          isExpanded: controller.overtimeFlag.value,
                        ),
                      ],
                      expansionCallback: controller.updateOvertimeFlag,
                      elevation: 4,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("All field are mandatory in this section"),
                const SizedBox(
                  height: 20,
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
