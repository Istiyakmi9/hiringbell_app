import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiringbell/pages/common/imulti_select_dropdown.dart';
import 'package:hiringbell/pages/job_post/job_post_controller.dart';

class SalaryDetail extends GetView<JobPostController> {
  const SalaryDetail({super.key});

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
            "Salary & Allowance",
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
                  leading: Icon(Icons.account_balance_wallet_outlined),
                  title: Text(
                    'Salary & Allowance',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text('Define salary/month & allowance'),
                  trailing: Icon(Icons.more_vert),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Min salary"),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              decoration:
                                  controller.getFiledInputDecoration("0.00"),
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Max salary"),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              decoration:
                                  controller.getFiledInputDecoration("0.00"),
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Bonus"),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              decoration:
                                  controller.getFiledInputDecoration("0.00"),
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Special Allowance"),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              decoration:
                                  controller.getFiledInputDecoration("0.00"),
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
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
                      children: [
                        ExpansionPanel(
                          headerBuilder: (context, isOpen) {
                            return const ListTile(
                              title: Text("HRA"),
                              subtitle: Text("Use this HRA allowance "),
                              leading: Icon(Icons.house),
                            );
                          },
                          body: const Text("Now open!"),
                          isExpanded: controller.openFlags[0],
                        ),
                      ],
                      expansionCallback: controller.updateAllowanceExpansion,
                      elevation: 4,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Checkbox(
                            value: false,
                            onChanged: (bool? flag) {},
                          ),
                          const Text('HRA'),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(Icons.house),
                        ],
                      ),
                      SizedBox(
                        height: 60,
                        width: 120,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: controller.getFiledInputDecoration("0.00",
                              iconSize: 16),
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Checkbox(
                            value: false,
                            onChanged: (bool? flag) {},
                          ),
                          const Text('Travel allowance'),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(Icons.car_rental),
                        ],
                      ),
                      SizedBox(
                        height: 60,
                        width: 120,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: controller.getFiledInputDecoration("0.00",
                              iconSize: 16),
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Checkbox(
                            value: false,
                            onChanged: (bool? flag) {},
                          ),
                          const Text('Food allowance'),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(Icons.dinner_dining),
                        ],
                      ),
                      SizedBox(
                        height: 35,
                        width: 120,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: controller.getFiledInputDecoration("0.00",
                              iconSize: 16),
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  title: const Text(
                    'Job Category',
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
