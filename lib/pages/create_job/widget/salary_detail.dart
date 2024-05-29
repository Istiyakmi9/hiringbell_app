import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiringbell/models/key_value_items.dart';
import 'package:hiringbell/pages/common/imulti_select/imulti_select_dropdown.dart';
import 'package:hiringbell/pages/create_job/job_post_controller.dart';

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
                                if (value == null || value.isEmpty) {
                                  return "Minimum salary is required";
                                }

                                controller.jobPost.minimumCTC =
                                    double.parse(value);
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
                                if (value == null || value.isEmpty) {
                                  return "Maximum salary is required";
                                }

                                controller.jobPost.maximumCTC =
                                    double.parse(value);
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
                                if (value != null && value.isNotEmpty) {
                                  controller.jobPost.bonus =
                                      double.parse(value);
                                }

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
                      dividerColor: Colors.grey.shade300,
                      children: [
                        ExpansionPanel(
                          headerBuilder: (context, isOpen) {
                            return const ListTile(
                              title: Text(
                                "HRA",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              subtitle: Text(
                                "Use this section for HRA allowance",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              leading: Icon(Icons.house),
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
                                  "Enter for HRA allowance amount",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration:
                                      controller.getFiledInputDecoration("0.00",
                                          iconSize: 16),
                                  textInputAction: TextInputAction.next,
                                  validator: (value) {
                                    if (value != null && value.isNotEmpty) {
                                      controller.jobPost.hraAllowanceAmount =
                                          double.parse(value);
                                      controller.jobPost.isHRAAllowance = true;
                                    }

                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                          isExpanded: controller.openFlags[0],
                        ),
                        ExpansionPanel(
                          headerBuilder: (context, isOpen) {
                            return const ListTile(
                              title: Text(
                                "Travel allowance",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              subtitle: Text(
                                "Use this section for Travel allowance",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              leading: Icon(Icons.car_rental),
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
                                  "Enter for Travel allowance amount",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration:
                                      controller.getFiledInputDecoration("0.00",
                                          iconSize: 16),
                                  textInputAction: TextInputAction.next,
                                  validator: (value) {
                                    if (value != null && value.isNotEmpty) {
                                      controller.jobPost.travelAllowanceAmount =
                                          double.parse(value);
                                      controller.jobPost.isTravelAllowance =
                                          true;
                                    }

                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                          isExpanded: controller.openFlags[1],
                        ),
                        ExpansionPanel(
                          headerBuilder: (context, isOpen) {
                            return const ListTile(
                              title: Text(
                                "Food allowance",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              subtitle: Text(
                                "Use this section for Food allowance",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              leading: Icon(Icons.dinner_dining),
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
                                  "Enter food allowance amount",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration:
                                      controller.getFiledInputDecoration("0.00",
                                          iconSize: 16),
                                  textInputAction: TextInputAction.next,
                                  validator: (value) {
                                    if (value != null && value.isNotEmpty) {
                                      controller.jobPost.foodAllowanceAmount =
                                          double.parse(value);
                                      controller.jobPost.isFoodAllowance = true;
                                    }

                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                          isExpanded: controller.openFlags[2],
                        ),
                      ],
                      expansionCallback: controller.updateAllowanceExpansion,
                      elevation: 4,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  title: const Text(
                    'Currency',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  trailing: SizedBox(
                    width: 200,
                    child: IMultiSelectDropdown<KeyValuePair>(
                      hintText: 'Select currency',
                      items: <KeyValuePair>[
                        KeyValuePair(text: 'Ut. Arab Emir. Dirham', value: 1),
                        KeyValuePair(text: 'Bahraini dinar', value: 2),
                        KeyValuePair(text: 'Iraqi Dinar', value: 3),
                        KeyValuePair(text: 'Iranian Rial', value: 4),
                        KeyValuePair(text: 'Omani Rial', value: 5),
                        KeyValuePair(text: 'Saudi Riyal', value: 6),
                        KeyValuePair(text: 'Qatari Rial', value: 7),
                        KeyValuePair(text: 'Kuwaiti Dinar', value: 8),
                      ],
                      decoration: IMultiSelectDropdownDecoration(
                        closedFillColor: Colors.grey.shade100,
                      ),
                      onChanged: (value) {
                        controller.jobPost.salaryCurrency = value.value;
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
