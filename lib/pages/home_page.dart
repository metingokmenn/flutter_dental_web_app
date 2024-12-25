import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/about_section.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/footer_section.dart';
import '../widgets/services_section.dart';
import '../widgets/slider_section.dart';

class ScrollControllerGetX extends GetxController {
  // Updated the class name for clarity
  final ScrollController scrollController = ScrollController();

  void scrollToSection(GlobalKey sectionKey) {
    final context = sectionKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final sliderKey = GlobalKey();
  final aboutKey = GlobalKey();
  final servicesKey = GlobalKey();
  final footerKey = GlobalKey();

  // Updated the variable name to match the controller's name
  final ScrollControllerGetX scrollControllerGetX =
      Get.put(ScrollControllerGetX());

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Dt. İlayda Tutku Zenci',
        centerTitle: false,
        onHomePressed: () => scrollControllerGetX.scrollToSection(sliderKey),
        onAboutPressed: () => scrollControllerGetX.scrollToSection(aboutKey),
        onServicesPressed: () =>
            scrollControllerGetX.scrollToSection(servicesKey),
        onContactPressed: () => scrollControllerGetX.scrollToSection(footerKey),
      ),
      body: SingleChildScrollView(
        controller: scrollControllerGetX.scrollController,
        child: Column(
          children: [
            Padding(
              key: sliderKey,
              padding: const EdgeInsets.only(top: 8),
              child:  SliderSection(),
            ),
            Container(
              key: aboutKey,
              child: const AboutSection(),
            ),
            const Divider(
              indent: 100,
              endIndent: 100,
              thickness: 0.5,
            ),
            Container(
              key: servicesKey,
              child: const ServicesSection(),
            ),
            Container(
              key: footerKey,
              color: Colors.red,
              height: screenHeight * 0.3,
              child: const FooterSection(),
            ),
          ],
        ),
      ),
    );
  }
}
