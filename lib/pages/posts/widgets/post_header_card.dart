import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hiringbell/pages/posts/posts_controller.dart';
import 'package:jiffy/jiffy.dart';

class PostHeaderCard extends StatelessWidget {
  PostHeaderCard({super.key});

  var controller = Get.put(PostsController());

  @override
  Widget build(BuildContext context) {
    var currentUser = controller.util?.getUserDetail();
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 40.0,
            backgroundImage: NetworkImage(
              "https://cdn-icons-png.flaticon.com/512/149/149071.png",
            ),
          ),
          // Profile information widgets go here
          const SizedBox(height: 10.0),
          Text(
            "${currentUser?.firstName} ${currentUser?.lastName}",
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
              "Since ${Jiffy.parse(currentUser?.createdOn.toString() ?? "").format(pattern: "dd MMM, yyyy")}"),
          const SizedBox(height: 10.0),
          Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.location_on),
                    Text(currentUser?.address ?? "N/A"),
                  ],
                ),
              ),
              SizedBox(
                width: 120,
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                    padding: WidgetStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                    ),
                    backgroundColor: WidgetStateProperty.all<Color>(
                      Theme.of(context).colorScheme.primary,
                    ),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 0,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    controller.loadJobPostPage();
                  },
                  label: const Text(
                    "Create a job",
                    style: TextStyle(color: Colors.white),
                  ),
                  icon: const Icon(
                    Icons.post_add,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
