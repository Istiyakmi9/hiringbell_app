import 'package:hiringbell/models/constants.dart';

class KeyValuePair {
  int value = 0;
  String text = Constants.empty;

  KeyValuePair({required this.value, required this.text});

  @override
  String toString() {
    return text;
  }
}
