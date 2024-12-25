import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SliderController extends GetxController {
  final PageController pageController = PageController();
  var currentPage = 0.obs; // Observable for current page
  final List<String> imagePaths = [
    'assets/images/photo-1.jpg',
    'assets/images/photo-2.jpeg',
    'assets/images/photo-3.jpg',
    'assets/images/photo-5.jpg'
  ];

  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    // Ensuring the PageController is attached before animating
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAutoSlide();
    });
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (currentPage.value < imagePaths.length - 1) {
        currentPage.value++;
      } else {
        currentPage.value = 0; // Reset to the first page
      }

      // Ensure the controller is properly attached before animating
      if (pageController.hasClients) {
        pageController.animateToPage(
          currentPage.value,
          duration: const Duration(milliseconds: 1200),
          curve: Curves.decelerate,
        );
      }
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    pageController.dispose();
    super.onClose();
  }
}
