import 'package:flutter/material.dart';
import 'package:hiringbell/pages/common/bt_input_decoration/bt_input_decoration.dart';

import '../bt_select/form_util.dart';

class BTTextFormField extends StatelessWidget {
  final String? hintText;
  final String? initialValue;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final int? minLines;
  final int? maxLines;
  final IconData? prefixIcon;
  final bool isEmptyValidation;
  final String? emptyMessage;
  final bool obscureText;
  final TextEditingController? controller;

  const BTTextFormField({
    super.key,
    this.hintText,
    this.initialValue,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.maxLines,
    this.minLines,
    this.prefixIcon,
    this.isEmptyValidation = true,
    this.emptyMessage,
    this.obscureText = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    // String _value = initialValue ?? "";

    return TextFormField(
      controller: controller,
      // keyboardType: keyboardType ?? FormUtil.getKeyboardType(T, minLines),
      keyboardType: keyboardType ??
          ((minLines != null && minLines! > 1)
              ? TextInputType.multiline
              : TextInputType.text),
      decoration: btInputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
      ),
      textInputAction: TextInputAction.next,
      initialValue: FormUtil.isEdit ? initialValue : null,
      obscureText: obscureText,
      onChanged: (value) {
        if (onChanged == null) return;
        // onChanged!(convertStringToType<T>(value));
        onChanged!(value);
      },
      validator: (value) {
        if (isEmptyValidation && (value == null || value.trim().isEmpty)) {
          return emptyMessage ?? "Please enter $hintText";
        }
        if (validator == null) return null;
        if (value == null) return validator!(null);
        // isEmptyValidation ? validator!(value! as T) : validator!(value as T?);
        // return validator!(convertStringToType<T>(value!));
        return validator!(value);
      },
      minLines: minLines,
      maxLines: obscureText ? 1 : maxLines,
    );
  }

//   InputDecoration decoration() {
//     return InputDecoration(
//       border: const OutlineInputBorder(),
//       filled: true,
//       fillColor: Colors.white,
//       contentPadding: prefixIcon == null
//           ? const EdgeInsets.all(10.0)
//           : const EdgeInsets.symmetric(vertical: 2),
//       prefixIcon: prefixIcon == null
//           ? null
//           : Icon(
//               prefixIcon,
//               color: Colors.blueAccent,
//               size: 20,
//             ),
//       focusedBorder: const OutlineInputBorder(
//         borderSide: BorderSide(color: Colors.grey, width: 1.0),
//       ),
//       enabledBorder: const OutlineInputBorder(
//         borderSide: BorderSide(color: Colors.grey, width: 1.0),
//       ),
//       hintText: hintText,
//     );
//   }
}

T convertStringToType<T>(String value) {
  if (T == int || T is int) {
    return int.parse(value) as T;
  } else if (T == double || T is double) {
    return double.parse(value) as T;
  } else if (T == String || T is String) {
    return value as T;
  } else {
    throw ArgumentError("Unsupported type");
  }
}
