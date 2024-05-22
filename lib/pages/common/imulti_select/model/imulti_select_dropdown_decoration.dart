part of '../imulti_select_dropdown.dart';

class IMultiSelectDropdownDecoration {
  /// [IMultiSelectDropdown] field color (closed state).
  ///
  /// Default to [Colors.white].
  final Color? closedFillColor;

  /// [IMultiSelectDropdown] overlay color (opened/expanded state).
  ///
  /// Default to [Colors.white].
  final Color? expandedFillColor;

  /// [IMultiSelectDropdown] box shadow (closed state).
  final List<BoxShadow>? closedShadow;

  /// [IMultiSelectDropdown] box shadow (opened/expanded state).
  final List<BoxShadow>? expandedShadow;

  /// Suffix icon for closed state of [IMultiSelectDropdown].
  final Widget? closedSuffixIcon;

  /// Suffix icon for opened/expanded state of [IMultiSelectDropdown].
  final Widget? expandedSuffixIcon;

  /// Border for closed state of [IMultiSelectDropdown].
  final BoxBorder? closedBorder;

  /// Border radius for closed state of [IMultiSelectDropdown].
  final BorderRadius? closedBorderRadius;

  /// Error border for closed state of [IMultiSelectDropdown].
  final BoxBorder? closedErrorBorder;

  /// Error border radius for closed state of [IMultiSelectDropdown].
  final BorderRadius? closedErrorBorderRadius;

  /// Border for opened/expanded state of [IMultiSelectDropdown].
  final BoxBorder? expandedBorder;

  /// Border radius for opened/expanded state of [IMultiSelectDropdown].
  final BorderRadius? expandedBorderRadius;

  /// The style to use for the [IMultiSelectDropdown] header hint.
  final TextStyle? hintStyle;

  /// The style to use for the [IMultiSelectDropdown] header text.
  final TextStyle? headerStyle;

  /// The style to use for the [IMultiSelectDropdown] no result found area.
  final TextStyle? noResultFoundStyle;

  /// The style to use for the string returning from [validator].
  final TextStyle? errorStyle;

  /// The style to use for the [IMultiSelectDropdown] list item text.
  final TextStyle? listItemStyle;

  /// [IMultiSelectDropdown] scrollbar decoration (opened/expanded state).
  final ScrollbarThemeData? overlayScrollbarDecoration;

  /// [IMultiSelectDropdown] search field decoration.
  final SearchFieldDecoration? searchFieldDecoration;

  /// [IMultiSelectDropdown] list item decoration.
  final ListItemDecoration? listItemDecoration;

  const IMultiSelectDropdownDecoration({
    this.closedFillColor,
    this.expandedFillColor,
    this.closedShadow,
    this.expandedShadow,
    this.closedSuffixIcon,
    this.expandedSuffixIcon,
    this.closedBorder,
    this.closedBorderRadius,
    this.closedErrorBorder,
    this.closedErrorBorderRadius,
    this.expandedBorder,
    this.expandedBorderRadius,
    this.hintStyle,
    this.headerStyle,
    this.noResultFoundStyle,
    this.errorStyle,
    this.listItemStyle,
    this.overlayScrollbarDecoration,
    this.searchFieldDecoration,
    this.listItemDecoration,
  });

  static const Color _defaultFillColor = Colors.white;
}