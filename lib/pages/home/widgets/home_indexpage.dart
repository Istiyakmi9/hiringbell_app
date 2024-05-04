import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiringbell/services/http_service.dart';
import 'package:hiringbell/utilities/Util.dart';

import '../home_controller.dart';

class HomeIndexPage extends StatefulWidget {
  const HomeIndexPage({super.key});

  @override
  State<HomeIndexPage> createState() => _HomeIndexPageState();
}

class _HomeIndexPageState extends State<HomeIndexPage> {
  var home = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    var home = Get.put(HomeController());

    return Obx(
      () => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            home.isHomepageReady.value
                ? home.posts.value.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                          itemCount: home.posts.value.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  leading: const CircleAvatar(
                                    radius: 30.0,
                                    backgroundImage: NetworkImage(
                                        "https://www.hiringbell.com/resources/post_21/post_1713596753356.jpg"),
                                    backgroundColor: Colors.transparent,
                                  ),
                                  trailing: Text(
                                    home.posts.value[index].fullName!,
                                    style: const TextStyle(
                                        color: Colors.green, fontSize: 15),
                                  ),
                                  title: Text(home
                                      .posts.value[index].shortDescription!),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 20,
                                  ),
                                  child: Text(home
                                      .posts.value[index].completeDescription!),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 20,
                                  ),
                                  child: Image(
                                    image: home.getImage(home.posts.value[index].files),
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      )
                    : const Text("No record found")
                : const CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
