import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiringbell/pages/common/imulti_select/imulti_select_dropdown.dart';
import 'package:hiringbell/pages/create_job/job_post_controller.dart';
import 'package:hiringbell/pages/create_job/widget/days_card.dart';

import '../../common/bt_single_select/bt_single_select.dart';

class WorkDetail extends GetView<JobPostController> {
  const WorkDetail({super.key});

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
            "Work experience information",
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
                    'Work experience & Shift detail',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text('Fill experience shift and weekends'),
                  trailing: Icon(Icons.more_vert),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  title: const Text(
                    'Working hours',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  trailing: SizedBox(
                    width: 200,
                    // child: IMultiSelectDropdown<int>(
                    //   initialItem: controller.jobPost.dailyWorkingHours,
                    //   hintText: 'Hours',
                    //   items: controller.listDailyWorkingHours,
                    //   decoration: IMultiSelectDropdownDecoration(
                    //     closedFillColor: Colors.grey.shade100,
                    //   ),
                    //   onChanged: (value) {
                    //     controller.jobPost.dailyWorkingHours = value;
                    //   },
                    // ),
                    child: BTSingleSelect(
                      hintText: 'Hours',
                      items: controller.listDailyWorkingHours,
                      initSelectionCriteria: (c) =>
                          c == controller.jobPost.dailyWorkingHours,
                      onChanged: (value) {
                        controller.jobPost.dailyWorkingHours = value;
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
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
                                "Candide experience detail",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              subtitle: Text(
                                "Use this section to add experience i.e. overseas and local",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              leading: Icon(Icons.add_alarm_sharp),
                            );
                          },
                          body: Padding(
                            padding: const EdgeInsets.only(
                              left: 15,
                              right: 15,
                              top: 6,
                              bottom: 16,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Enter overseas experience detail",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      // child: IMultiSelectDropdown<int>(
                                      //   initialItem:
                                      //       controller.overseasExperienceYears,
                                      //   hintText: 'Years',
                                      //   items: controller.listExperience,
                                      //   decoration:
                                      //       IMultiSelectDropdownDecoration(
                                      //     closedFillColor: Colors.grey.shade100,
                                      //   ),
                                      //   onChanged: (years) {
                                      //     controller
                                      //             .jobPost.overseasExperience =
                                      //         years * 12 +
                                      //             controller
                                      //                 .overseasExperienceMonths;
                                      //     debugPrint(
                                      //         'oversease exp: ${controller.jobPost.overseasExperience}');
                                      //   },
                                      // ),
                                      child: BTSingleSelect(
                                        hintText: 'Years',
                                        items: controller.listExperience,
                                        initSelectionCriteria: (c) =>
                                            c ==
                                            controller.overseasExperienceYears,
                                        onChanged: (years) {
                                          controller
                                                  .jobPost.overseasExperience =
                                              years * 12 +
                                                  controller
                                                      .overseasExperienceMonths;
                                          debugPrint(
                                              'overseas exp: ${controller.jobPost.overseasExperience}');
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      // child: IMultiSelectDropdown<int>(
                                      //   initialItem:
                                      //       controller.overseasExperienceMonths,
                                      //   hintText: 'Months',
                                      //   items: controller.listMonths,
                                      //   decoration:
                                      //       IMultiSelectDropdownDecoration(
                                      //     closedFillColor: Colors.grey.shade100,
                                      //   ),
                                      //   onChanged: (months) {
                                      //     controller
                                      //             .jobPost.overseasExperience =
                                      //         months +
                                      //             controller
                                      //                     .overseasExperienceYears *
                                      //                 12;
                                      //     debugPrint(
                                      //         'oversease exp: ${controller.jobPost.overseasExperience}');
                                      //   },
                                      // ),
                                      child: BTSingleSelect(
                                        hintText: 'Months',
                                        items: controller.listMonths,
                                        initSelectionCriteria: (c) =>
                                            c ==
                                            controller.overseasExperienceMonths,
                                        onChanged: (months) {
                                          controller
                                                  .jobPost.overseasExperience =
                                              months +
                                                  controller
                                                          .overseasExperienceYears *
                                                      12;
                                          debugPrint(
                                              'overseas exp: ${controller.jobPost.overseasExperience}');
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  "Enter local experience detail",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      // child: IMultiSelectDropdown<int>(
                                      //   initialItem:
                                      //       controller.localExperienceYears,
                                      //   hintText: 'Years',
                                      //   items: controller.listExperience,
                                      //   decoration:
                                      //       IMultiSelectDropdownDecoration(
                                      //     closedFillColor: Colors.grey.shade100,
                                      //   ),
                                      //   onChanged: (years) {
                                      //     controller.jobPost.localExperience =
                                      //         years * 12 +
                                      //             controller
                                      //                 .localExperienceMonths;
                                      //     debugPrint(
                                      //         'local exp: ${controller.jobPost.localExperience}');
                                      //   },
                                      // ),
                                      child: BTSingleSelect(
                                        hintText: 'Years',
                                        items: controller.listExperience,
                                        initSelectionCriteria: (c) =>
                                            c ==
                                            controller.localExperienceYears,
                                        onChanged: (years) {
                                          controller.jobPost.localExperience =
                                              years * 12 +
                                                  controller
                                                      .localExperienceMonths;
                                          debugPrint(
                                              'local exp: ${controller.jobPost.localExperience}');
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      // child: IMultiSelectDropdown<int>(
                                      //   initialItem:
                                      //       controller.localExperienceMonths,
                                      //   hintText: 'Months',
                                      //   items: controller.listMonths,
                                      //   decoration:
                                      //       IMultiSelectDropdownDecoration(
                                      //     closedFillColor: Colors.grey.shade100,
                                      //   ),
                                      //   onChanged: (months) {
                                      //     controller.jobPost.localExperience =
                                      //         months +
                                      //             controller
                                      //                     .localExperienceYears *
                                      //                 12;
                                      //   },
                                      // ),
                                      child: BTSingleSelect(
                                        hintText: 'Months',
                                        items: controller.listMonths,
                                        initSelectionCriteria: (c) =>
                                            c ==
                                            controller.localExperienceMonths,
                                        onChanged: (months) {
                                          controller.jobPost.localExperience =
                                              months +
                                                  controller
                                                          .localExperienceYears *
                                                      12;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          isExpanded: controller.experienceFlag.value,
                        ),
                      ],
                      expansionCallback: controller.updateExperienceFlag,
                      elevation: 4,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: controller.days.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return DaysCard(
                      label: controller.days[index].text,
                      index: index + 1,
                      initialValue: controller.getWeekdaysStatus(index + 1),
                      onChanged: (status) {
                        debugPrint('days updateWeekdaysStatusUI  called');
                        controller.updateWeekdaysStatusUI(index + 1, status);
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
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
