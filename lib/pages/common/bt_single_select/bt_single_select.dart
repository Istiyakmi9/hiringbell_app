import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import '../imulti_select/imulti_select_dropdown.dart'; // For firstWhereOrNull

class CustomMultiSelectDropdown<T> extends StatelessWidget {
  final String hintText;
  final List<T> items;
  final void Function(T)? onChanged;
  final IMultiSelectDropdownDecoration? decoration;
  final bool Function(T)? selectionCriteria;
  final T? initialItem;

  const CustomMultiSelectDropdown(
      {super.key,
      required this.hintText,
      required this.items,
      this.onChanged,
      this.selectionCriteria,
      this.initialItem,
      this.decoration});

  @override
  Widget build(BuildContext context) {
    // Automatically find the initial item based on the selection criteria if it's not provided
    T? autoInitialItem = initialItem ??
        (selectionCriteria != null
            ? items.firstWhereOrNull(selectionCriteria!)
            : null);

    return IMultiSelectDropdown<T>(
      initialItem: autoInitialItem,
      hintText: hintText,
      items: items,
      decoration: decoration == null
          ? null
          : IMultiSelectDropdownDecoration(
              closedFillColor: Colors.grey.shade50,
            ),
      onChanged: onChanged,
    );
  }
}
