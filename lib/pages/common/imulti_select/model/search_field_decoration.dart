part of '../imulti_select_dropdown.dart';

class SearchFieldDecoration {
  /// Fill color for [IMultiSelectDropdown] search field.
  ///
  /// Default to Color(0xFFFAFAFA).
  final Color? fillColor;

  /// Layout constraints for [IMultiSelectDropdown] search field.
  final BoxConstraints? constraints;

  /// Content spacing for [IMultiSelectDropdown] search field.
  final EdgeInsetsGeometry? contentPadding;

  /// Text Style (text being edited) for [IMultiSelectDropdown] search field.
  final TextStyle? textStyle;

  /// Hint text style for [IMultiSelectDropdown] search field.
  final TextStyle? hintStyle;

  /// Icon (before the text area) for [IMultiSelectDropdown] search field.
  final Widget? prefixIcon;

  /// Icon (after the text area) for [IMultiSelectDropdown] search field.
  /// "onClear" callback can be used to clear typed text appearing on search field.
  final Widget Function(VoidCallback onClear)? suffixIcon;

  /// Border for [IMultiSelectDropdown] search field.
  final InputBorder? border;

  /// Focused border for [IMultiSelectDropdown] search field.
  final InputBorder? focusedBorder;

  const SearchFieldDecoration({
    this.fillColor,
    this.constraints,
    this.contentPadding,
    this.textStyle,
    this.hintStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.border,
    this.focusedBorder,
  });

  static const _defaultFillColor = Color(0xFFFAFAFA);
}