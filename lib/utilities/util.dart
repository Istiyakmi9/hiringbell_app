import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiringbell/models/constants.dart';
import 'package:hiringbell/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Util {
  static const userDetail = "user";

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
    return Util._internal();
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
    } catch (e) {
      return User();
    }
  }

  ImageProvider<Object> getImageProvider(String imageUrl) {
    Image image = getImage(imageUrl);
    return image.image;
  }

  Widget getImageWidget(String imageUrl) {
    return getImage(imageUrl);
  }

  void showToast(String message, {String type = Constants.success}) {
    Color color;
    Color textColor;
    switch (type) {
      case Constants.fail:
        color = Colors.red;
        textColor = Colors.white;
        break;
      case Constants.warning:
        color = Colors.yellow;
        textColor = Colors.black;
        break;
      default:
        color = Colors.green;
        textColor = Colors.white;
        break;
    }

    Get.snackbar(
      type,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: color,
      colorText: textColor,
      maxWidth: 350,
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
    );
  }

  Image getImage(String? imageUrl) {
    Image image = Image.asset("assets/user.png");
    if (imageUrl == null || imageUrl == "") {
      return image;
    }

    try {
      image = Image.network(
        imageUrl,
        fit: BoxFit.fill,
        errorBuilder: (context, _, stack) {
          return Image.asset("assets/user.png");
        },
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
      );
    } catch (e) {
      image = Image.asset("assets/user.png");
      debugPrint('Fail to load image');
    }

    return image;
  }

  Util._internal();
}
