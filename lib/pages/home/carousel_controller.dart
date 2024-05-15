import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarouselController extends GetxController {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  var activePage = 0.obs;

  updateIndicator(int index) {
    activePage(index);
  }
}