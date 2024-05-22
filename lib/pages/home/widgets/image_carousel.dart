import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiringbell/models/files.dart';
import 'package:hiringbell/pages/home/carousel_controller.dart';
import 'package:hiringbell/services/http_service.dart';
import 'package:hiringbell/utilities/Util.dart';

class ImageCarousel extends StatelessWidget {
  final Util util = Util.getInstance();

  ImageCarousel({super.key, required this.images});

  List<FileDetail> images = [];
  var controller = Get.put(CarouselController());
  HttpService http = HttpService.getInstance();

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(
      imagesLength,
      (index) {
        return Container(
          margin: const EdgeInsets.all(3),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
              color: currentIndex == index ? Colors.black : Colors.black26,
              shape: BoxShape.circle),
        );
      },
    );
  }

  String? getImagePath(String? relativePath) {
    String? absolutePath;
    if (relativePath != null && relativePath.isNotEmpty) {
      absolutePath = "${http.getImageBaseUrl}$relativePath";
    }

    return absolutePath;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .30,
          width: MediaQuery.of(context).size.width,
          child: PageView.builder(
            itemCount: images.length,
            pageSnapping: true,
            onPageChanged: (index) {
              controller.updateIndicator(index);
              debugPrint("$index");
            },
            itemBuilder: (context, position) {
              return Container(
                margin: const EdgeInsets.all(10.0),
                child: util.getImage(getImagePath(images[position].filePath)),
              );
            },
          ),
        ),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: indicators(images.length, controller.activePage.value),
          ),
        )
      ],
    );
  }
}
