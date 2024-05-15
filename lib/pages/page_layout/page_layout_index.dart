import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hiringbell/pages/home/widgets/search_box.dart';
import 'package:hiringbell/pages/page_layout/page_layout_controller.dart';
import 'package:hiringbell/pages/page_layout/widget/screen_manager.dart';

import '../../models/navigate.dart';

class PageLayoutIndex extends StatelessWidget {
  PageLayoutIndex({super.key});

  var controller = Get.put(PageLayoutController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 2
                ),
                child: CircleAvatar(
                  radius: 23.0,
                  backgroundColor: Colors.grey.shade300,
                  child: Text(controller.user.firstName[0]),
                ),
              ),
            ),
            const Expanded(
              flex: 9,
              child: SearchBox(),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                onPressed: () {
                  Get.offAllNamed(Navigate.login);
                },
                icon: const Icon(Icons.power_settings_new_outlined),
              ),
            )
          ],
        ),
      ),
      body: Obx(
        () => ScreenManager(index: controller.selectedIndex.value),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people_alt_outlined),
              label: 'Friends',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.portrait_sharp),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_active),
              label: 'Notification',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.workspace_premium_outlined),
              label: 'Jobs',
            ),
          ],
          currentIndex: controller.selectedIndex.value,
          selectedItemColor: Colors.black87,
          unselectedItemColor: Colors.grey,
          onTap: (index) => {controller.onItemTapped(index)},
        ),
      ),
    );
  }
}
