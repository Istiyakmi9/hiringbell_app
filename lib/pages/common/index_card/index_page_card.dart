import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiringbell/models/constants.dart';
import 'package:hiringbell/models/posts.dart';
import 'package:hiringbell/pages/home/home_controller.dart';
import 'package:hiringbell/pages/home/widgets/image_carousel.dart';
import 'package:hiringbell/utilities/Util.dart';

class IndexPageCard extends StatelessWidget {
  final Posts posts;

  IndexPageCard({super.key, required this.posts});

  final Util util = Util.getInstance();
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: posts.profileImage!.isEmpty
                ? CircleAvatar(
                    radius: 30.0,
                    backgroundColor: controller.getBackgroundColor(
                      posts.fullName![0].toUpperCase(),
                    ),
                    child: Text(posts.fullName![0]),
                  )
                : CircleAvatar(
                    radius: 30.0,
                    backgroundImage: util.getImageProvider(Constants.empty),
                    backgroundColor: Colors.transparent,
                  ),
            trailing: const Icon(Icons.keyboard_control_outlined),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  posts.fullName!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                const Text(
                  "0 followers",
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
                const Row(
                  children: [
                    Text(
                      "2h",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Icon(
                      Icons.gps_fixed,
                      size: 14,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(posts.shortDescription!),
                Text(posts.completeDescription!),
              ],
            ),
          ),
          if (posts.files.length == 1)
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: util.getImage(controller.getImageUrl(posts.files)),
              ),
            )
          else
            Center(
              child: ImageCarousel(
                images: posts.files,
              ),
            ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: const Divider(
              color: Colors.black12,
              height: 1,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: null,
                  icon: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.thumb_up_alt_outlined,
                        color: Colors.black54,
                        size: 18,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "Like",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: null,
                  icon: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.share,
                        color: Colors.black54,
                        size: 18,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "Share",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: null,
                  icon: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.comment,
                        color: Colors.black54,
                        size: 18,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "Comment",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: null,
                  icon: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.call,
                        color: Colors.black54,
                        size: 18,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "Apply",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
