import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiringbell/models/navigate.dart';
import 'package:hiringbell/pages/home/home_controller.dart';
import 'package:hiringbell/pages/home/widgets/home_indexpage.dart';
import 'package:hiringbell/pages/home/widgets/screen_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var home = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(home.user.firstName),
            const Text("center"),
            IconButton(
              onPressed: () {
                Get.offAllNamed(Navigate.login);
              },
              icon: const Icon(Icons.power_settings_new_outlined),
            )
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: home.onRefresh,
        child: Obx(
          () => ScreenManager(index: home.selectedIndex.value),
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
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
          ],
          currentIndex: home.selectedIndex.value,
          selectedItemColor: Colors.amber[800],
          onTap: (index) => {home.onItemTapped(index)},
        ),
      ),
    );
  }
}
