import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hiringbell/pages/posts/posts_controller.dart';

class PostHeaderCard extends StatelessWidget {
  PostHeaderCard({super.key});

  var controller = Get.put(PostsController());

  @override
  Widget build(BuildContext context) {
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
          const Text(
            "John Doe",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text("Software Engineer"),
          const SizedBox(height: 10.0),
          Row(
            children: [
              const Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on),
                    Text("New York, USA"),
                  ],
                ),
              ),
              SizedBox(
                width: 120,
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).colorScheme.primary,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
