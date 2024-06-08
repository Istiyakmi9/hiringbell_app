import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import '../imulti_select/imulti_select_dropdown.dart';
import 'form_util.dart'; // For firstWhereOrNull

class BTSingleSelect<T> extends StatelessWidget {
  final String hintText;
  final List<T> items;
  final void Function(T)? onChanged;
  final IMultiSelectDropdownDecoration? decoration;
  final bool Function(T)? initSelectionCriteria;
  final String? Function(T?)? validator;
  final bool isEmptyValidation;
  final String? emptyMessage;

  const BTSingleSelect(
      {super.key,
      required this.hintText,
      required this.items,
      this.onChanged,
      this.initSelectionCriteria,
      this.decoration,
      this.validator,
      this.isEmptyValidation = true,
      this.emptyMessage});

  @override
  Widget build(BuildContext context) {
    T? autoInitialItem = !FormUtil.isEdit || initSelectionCriteria == null
        ? null
        : items.firstWhereOrNull(initSelectionCriteria!);

    return IMultiSelectDropdown<T>.search(
      initialItem: autoInitialItem,
      hintText: hintText,
      items: items,
      decoration: decoration ??
          IMultiSelectDropdownDecoration(
            closedFillColor: Colors.grey.shade50,
          ),
      onChanged: onChanged,
      validator: (value) {
        if (isEmptyValidation && value == null) {
          return emptyMessage ?? "select $hintText";
        }

        if (validator != null) {
          validator!(value);
        }
        return null;
      },
    );
  }
}
