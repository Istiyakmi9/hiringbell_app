import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hiringbell/models/navigate.dart';
import 'package:hiringbell/pages/job_post/job_post_page.dart';

import '../../models/files.dart';
import '../../models/posts.dart';
import '../../models/user.dart';
import '../../services/http_service.dart';
import '../../utilities/Util.dart';

class PostsController extends GetxController {
  var count = 0.obs;
  var selectedIndex = 0.obs;
  var isHomepageReady = false.obs;
  var posts = RxList<Posts>();
  var pageIndex = 0.obs;
  User user = User();

  var isLoading = true.obs;
  var hasMore = true.obs;

  var controller = ScrollController();

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
        posts = RxList<Posts>();
        loadHomePage();
        break;
    }
  }

  Future<void> onRefresh() async {
    pageIndex(0);
    isLoading(true);
    hasMore(true);
    posts = RxList<Posts>();
    loadHomePage();
  }

  Future<void> loadHomePage() async {
    isHomepageReady(false);

    try {
      http.httpGet("core/userposts/getHomePage/${++pageIndex}").then((value) {
        if (value != null) {
          List<dynamic> items = value;
          for (var i = 0; i < items.length; i++) {
            posts.add(Posts.fromJson(items[i]));
          }

          isLoading(false);
        } else {
          Fluttertoast.showToast(msg: "Fail to load the page");
        }

        isHomepageReady(true);
      });
    } catch (e) {
      isHomepageReady(true);
    }
  }

  Future<void> loadNextPage() async {
    isLoading(true);

    try {
      http.httpGet("core/userposts/getHomePage/${++pageIndex}").then((value) {
        if (value != null) {
          List<dynamic> items = value;
          if (items.isNotEmpty) {
            for (var i = 0; i < items.length; i++) {
              posts.add(Posts.fromJson(items[i]));
            }
            isLoading(false);
          } else {
            isLoading(false);
            hasMore(false);
          }
        } else {
          Fluttertoast.showToast(msg: "Fail to load the page");
        }
      });
    } catch (e) {
      Fluttertoast.showToast(msg: "Fail to load...");
    }
  }

  ImageProvider<Object> getImage(List<Files> files) {
    ImageProvider<Object> object;
    object = NetworkImage("${http.getImageBaseUrl}${files.first.filePath}");

    return object;
  }

  getBackgroundColor(String letter) {
    Color color;
    switch (letter) {
      case 'R':
        color = Colors.red;
        break;
      case 'B':
        color = Colors.blueAccent;
        break;
      case 'I':
        color = Colors.indigoAccent;
        break;
      case 'V':
        color = Colors.purple;
        break;
      default:
        color = Colors.grey;
        break;
    }

    return color;
  }

  loadJobPostPage() {
    Get.to(const JobPostPage());
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Util util = Util.getInstance();
    user = util.getUserDetail();
  }
}