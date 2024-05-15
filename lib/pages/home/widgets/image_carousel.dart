import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiringbell/models/files.dart';
import 'package:hiringbell/pages/home/carousel_controller.dart';
import 'package:hiringbell/services/http_service.dart';

class ImageCarousel extends StatelessWidget {
  ImageCarousel({super.key, required this.images});

  List<Files> images = [];
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
                  child: Image.network("${http.getImageBaseUrl}${images[position].filePath!}"),
                );
              }),
        ),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: indicators(
                images.length, controller.activePage.value),
          ),
        )
      ],
    );
  }
}
