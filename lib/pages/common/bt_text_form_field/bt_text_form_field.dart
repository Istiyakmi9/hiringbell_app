import 'package:flutter/material.dart';

import '../bt_single_select/form_util.dart';

class BTTextFormField extends StatelessWidget {
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

  BTTextFormField({
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
    this.emptyMessage,
  });

  @override
  Widget build(BuildContext context) {
    // String _value = initialValue ?? "";

    return TextFormField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        filled: true,
        fillColor: Colors.white,
        contentPadding: prefixIcon == null
            ? const EdgeInsets.all(10.0)
            : const EdgeInsets.symmetric(vertical: 2),
        prefixIcon: prefixIcon == null
            ? null
            : Icon(
                prefixIcon,
                color: Colors.blueAccent,
                size: 20,
              ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
        hintText: hintText,
      ),
      textInputAction: TextInputAction.next,
      initialValue: FormUtil.isEdit ? initialValue : null,
      onChanged: onChanged,
      validator: (value) {
        if (isEmptyValidation && (value == null || value.isEmpty)) {
          return emptyMessage ?? "Please $hintText";
        }

        if (validator != null) {
          isEmptyValidation ? validator!(value!) : validator!(value);
        }
        return null;
      },
      minLines: minLines,
      maxLines: maxLines,
    );
  }
}
