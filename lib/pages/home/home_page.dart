// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiringbell/pages/home/home_controller.dart';
import 'package:hiringbell/pages/home/widgets/home_cards.dart';
import 'package:hiringbell/utilities/Util.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var home = Get.put(HomeController());
  Util util = Util.getInstance();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    home.onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    var home = Get.put(HomeController());

    return Obx(
      () => RefreshIndicator(
        onRefresh: home.onRefresh,
        child: Container(
          color: Colors.black12,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              home.isHomepageReady.value
                  ? home.posts.value.isNotEmpty
                      ? HomeCards()
                      : const Center(
                          child: Text("No record found"),
                        )
                  : const Center(
                      child: CircularProgressIndicator(),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
