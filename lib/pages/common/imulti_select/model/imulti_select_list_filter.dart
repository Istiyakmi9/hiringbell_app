part of '../imulti_select_dropdown.dart';

mixin IMultiSelectListFilter {
  /// Used to filter elements against query on
  /// [CustomDropdown<T>.search] or [CustomDropdown<T>.searchRequest]
  /// [CustomDropdown<T>.multiSelect] or [CustomDropdown<T>.multiSelectSearchRequest]
  bool filter(String query);
}