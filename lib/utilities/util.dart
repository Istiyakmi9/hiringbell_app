import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:hiringbell/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Util {
  static const userDetail = "user";

  static final Util util = Util._internal();
  static SharedPreferences? _prefs;

  static Future<void> init(SharedPreferences sharedPreferences) async {
    // ignore: unnecessary_null_comparison
    if (sharedPreferences == null) {
      throw Exception("Invalid Shred Preference object found");
    }

    _prefs = sharedPreferences;
  }

  static SharedPreferences getSharedPreferences() {
    return _prefs!;
  }

  static Util getInstance() {
    return util;
  }

  void setUserDetail(dynamic user) {
    String result = jsonEncode(user);
    _prefs!.setString(userDetail, result);
  }

  static void cleanAll() {
    for (String key in _prefs!.getKeys()) {
      debugPrint("Key deleting: $key");
      _prefs!.remove(key);
    }
  }

  User getUserDetail() {
    try {
      var user = _prefs!.get(userDetail) as String;
      dynamic result = jsonDecode(user);
      return User.fromJson(result);
    } catch(e) {
      return User();
    }
  }

  Util._internal();
}
