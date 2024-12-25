import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dental_web_app/pages/home_page.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/slider_controller.dart';

class SliderSection extends StatelessWidget {
  SliderSection({super.key});

  final ScrollControllerGetX scrollControllerGetX =
      Get.put(ScrollControllerGetX());

  @override
  Widget build(BuildContext context) {
    final SliderController sliderController = Get.put(SliderController());
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      clipBehavior: Clip.none, // Taşmaya izin ver
      children: [
        // Full-width Slider Section
        SizedBox(
          width: screenWidth,
          height: screenHeight * 0.8, // Slider yüksekliği
          child: Stack(
            children: [
              // Fade Effect Images
              Obx(() {
                return Stack(
                  children: List.generate(sliderController.imagePaths.length,
                      (index) {
                    return AnimatedOpacity(
                      opacity: sliderController.currentPage.value == index
                          ? 1.0
                          : 0.0,
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.easeInOut,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              sliderController.imagePaths[index],
                              bundle: rootBundle,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  }),
                );
              }),

              // Persistent Cards Positioned at the Bottom Edge of the Image Section
              Positioned(
                bottom: 0, // Kartın ne kadar taşacağını ayarla
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // First Card
                    _buildInfoCard(
                        title: "Hizmetlerimiz",
                        content: "Hizmetlerimiz hakkında detaylı bilgi alın",
                        context: context,
                        index: 0),

                    const SizedBox(width: 16), // Space between cards
                    // Second Card
                    _buildInfoCard(
                        title: "Hemen Randevu Oluşturun",
                        content: "+90 542 655 44 44",
                        context: context,
                        index: 1),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Function to Build a Card
  Widget _buildInfoCard(
      {required String title,
      String? content,
      required BuildContext context,
      required int index}) {
    return Card(
      color: Colors.white, // Semi-transparent background
      elevation: 8, // Higher elevation for depth effect
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        width: 600,
        height: 150, // Set card width
        padding: const EdgeInsets.all(16), // Inner padding
        child: Column(
          spacing: 8,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            index == 0 ? Text(content ?? '') : const SizedBox.shrink(),
            const SizedBox(height: 8), // Space between title and content
            index == 0
                ? IconButton(
                    onPressed: () {}, icon: const Icon(Icons.person_outline))
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.phone_outlined),
                      TextButton(
                        onPressed: () {
                          launchUrl(Uri.parse('tel:+905426554444'),
                              mode: LaunchMode.platformDefault);
                        },
                        child: Text(
                          content ?? '',
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
