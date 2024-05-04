import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hiringbell/models/posts.dart';
import 'package:hiringbell/models/user.dart';
import 'package:hiringbell/services/http_service.dart';
import 'package:hiringbell/utilities/Util.dart';

class HomeController extends GetxController {
  var count = 0.obs;
  var selectedIndex = 0.obs;
  var isHomepageReady = false.obs;
  var posts = RxList<Posts>();
  User user = User();

  HttpService http = HttpService.getInstance();

  incrementValue() {
    count++;
  }

  void onItemTapped(var index) {
    selectedIndex(index);

    switch (index) {
      case 1:
        break;
      case 2:
        break;
      default:
        loadHomePage();
        break;
    }
  }

  Future<void> onRefresh() async {
    switch (selectedIndex.value) {
      case 1:
        break;
      case 2:
        break;
      default:
        loadHomePage();
        break;
    }
  }

  Future<void> loadHomePage() async {
    isHomepageReady(false);

    try {
      http.httpGet("core/userposts/getHomePage/1").then((value) {
        if (value != null) {
          List<dynamic> items = value;
          posts = RxList<Posts>();
          for(var i = 0; i < items.length; i++) {
            posts.add(Posts.fromJson(items[i]));
          }
          Fluttertoast.showToast(msg: "Page is loading...");
        } else {
          Fluttertoast.showToast(msg: "Fail to load the page");
        }

        isHomepageReady(true);
      });
    } catch (e) {
      isHomepageReady(true);
    }
  }

  ImageProvider<Object> getImage(List<String> files) {
    ImageProvider<Object> object;
    object = NetworkImage("${http.getImageBaseUrl}${files.first}");

    return object;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Util util = Util.util;
    user = util.getUserDetail();
    loadHomePage();
  }
}
