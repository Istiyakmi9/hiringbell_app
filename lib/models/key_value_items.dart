import 'package:hiringbell/models/constants.dart';

class KeyValuePair<T> {
  T value;
  String text = Constants.empty;

  KeyValuePair({required this.value, required this.text});

  @override
  String toString() {
    return text;
  }
}
