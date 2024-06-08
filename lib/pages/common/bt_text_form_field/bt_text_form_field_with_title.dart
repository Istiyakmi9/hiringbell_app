import 'package:flutter/material.dart';

import 'bt_text_form_field.dart';

class BTTextFormFieldWithLabel extends StatelessWidget {
  final String label;
  final String? hintText;
  String? initialValue;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final int? minLines;
  final int? maxLines;
  final IconData? prefixIcon;
  final bool isEmptyValidation;
  final String? emptyMessage;

  BTTextFormFieldWithLabel({
    super.key,
    this.hintText,
    this.initialValue,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
    this.maxLines,
    this.minLines,
    this.prefixIcon,
    this.isEmptyValidation = true,
    required this.label,
    this.emptyMessage,
  });

  factory BTTextFormFieldWithLabel.currency({
    String? initialValue,
    final String? Function(String?)? validator,
    final ValueChanged<String>? onChanged,
    final bool? isEmptyValidation,
    required final String label,
    final String? emptyMessage,
  }) {
    return BTTextFormFieldWithLabel(
      label: label,
      hintText: "0.0",
      emptyMessage: emptyMessage,
      initialValue: initialValue,
      isEmptyValidation: isEmptyValidation ?? true,
      keyboardType: TextInputType.number,
      prefixIcon: Icons.currency_rupee,
      onChanged: onChanged,
      validator: validator,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        BTTextFormField(
          hintText: hintText ?? "Enter $label",
          initialValue: initialValue,
          onChanged: onChanged,
          validator: validator,
          isEmptyValidation: isEmptyValidation,
          emptyMessage: emptyMessage ?? "Please enter $label",
          keyboardType: keyboardType,
          maxLines: maxLines,
          minLines: minLines,
          prefixIcon: prefixIcon,
        ),
        const SizedBox(height: 2)
      ],
    );
  }
}
