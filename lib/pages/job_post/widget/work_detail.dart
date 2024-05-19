import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiringbell/pages/common/imulti_select_dropdown.dart';
import 'package:hiringbell/pages/job_post/job_post_controller.dart';

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
                    'Overseas exp',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 95,
                        child: IMultiSelectDropdown<String>(
                          hintText: 'Select job role',
                          items: controller.list,
                          initialItem: controller.list[0],
                          decoration: IMultiSelectDropdownDecoration(
                            closedFillColor: Colors.grey.shade100,
                          ),
                          onChanged: (value) {
                            debugPrint('changing value to: $value');
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 95,
                        child: IMultiSelectDropdown<String>(
                          hintText: 'Select job role',
                          items: controller.list,
                          initialItem: controller.list[0],
                          decoration: IMultiSelectDropdownDecoration(
                            closedFillColor: Colors.grey.shade100,
                          ),
                          onChanged: (value) {
                            debugPrint('changing value to: $value');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Local exp',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 95,
                        child: IMultiSelectDropdown<String>(
                          hintText: 'Select job role',
                          items: controller.list,
                          initialItem: controller.list[0],
                          decoration: IMultiSelectDropdownDecoration(
                            closedFillColor: Colors.grey.shade100,
                          ),
                          onChanged: (value) {
                            debugPrint('changing value to: $value');
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 95,
                        child: IMultiSelectDropdown<String>(
                          hintText: 'Select job role',
                          items: controller.list,
                          initialItem: controller.list[0],
                          decoration: IMultiSelectDropdownDecoration(
                            closedFillColor: Colors.grey.shade100,
                          ),
                          onChanged: (value) {
                            debugPrint('changing value to: $value');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Working hours',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  trailing: SizedBox(
                    width: 200,
                    child: IMultiSelectDropdown<String>(
                      hintText: 'Select job role',
                      items: controller.list,
                      initialItem: controller.list[0],
                      decoration: IMultiSelectDropdownDecoration(
                        closedFillColor: Colors.grey.shade100,
                      ),
                      onChanged: (value) {
                        debugPrint('changing value to: $value');
                      },
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
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.grey.shade300,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        child: Text(controller.days[index]),
                      ),
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
