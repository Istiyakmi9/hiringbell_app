import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hiringbell/pages/common/imulti_select_dropdown.dart';
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
                ListTile(
                  title: const Text(
                    'Visa Type',
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
                ListTile(
                  title: const Text(
                    'Job Type',
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
                    ListTile(
                      title: const Text(
                        'Max Age',
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
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.0,
                      ),
                      child: Text("Foreign Return & Over Time"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Checkbox(
                              value: false,
                              onChanged: (bool? flag) {},
                            ),
                            const Text('Compulsory'),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(Icons.flight_takeoff),
                          ],
                        ),
                        SizedBox(
                          height: 35,
                          width: 120,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: controller
                                .getFiledInputDecoration("0.00", iconSize: 16),
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Checkbox(
                              value: false,
                              onChanged: (bool? flag) {},
                            ),
                            const Text('Include'),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(Icons.timelapse),
                          ],
                        ),
                        SizedBox(
                          height: 35,
                          width: 120,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: controller
                                .getFiledInputDecoration("0.00", iconSize: 16),
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
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
