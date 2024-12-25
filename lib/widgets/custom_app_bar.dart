import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_dental_web_app/controllers/app_bar_controller.dart';
import 'package:flutter_dental_web_app/widgets/nav_items.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    super.key,
    this.title,
    this.titleSpacing,
    this.centerTitle,
    this.onHomePressed,
    this.onAboutPressed,
    this.onServicesPressed,
    this.onContactPressed,
  });

  final String? title;
  final double? titleSpacing;
  final bool? centerTitle;
  final VoidCallback? onHomePressed;
  final VoidCallback? onAboutPressed;
  final VoidCallback? onServicesPressed;
  final VoidCallback? onContactPressed;

  final AppBarController appBarController = Get.put(AppBarController());

  @override
  Widget build(BuildContext context) {
    return AppBar(
      primary: true,
      toolbarHeight: 400,
      backgroundColor: Colors.white,
      titleSpacing: 0,
      titleTextStyle:
          const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      centerTitle: true,
      leadingWidth: 80,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: 20,
        children: [
          SizedBox(
            width: 150,
            height: 250,
            child: Image.asset(
              'assets/images/logo.jpg',
              fit: BoxFit.contain,
            ),
          ),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NavItem(
                  isHover: appBarController.homePageHover.value,
                  text: 'Anasayfa',
                  routeName: '/',
                  onHover: (hover) {
                    appBarController.setHomePageHover(hover ?? false);
                  },
                  onTap: onHomePressed, // Add onTap for navigation
                ),
                _buildVerticalDivider(),
                NavItem(
                  isHover: appBarController.aboutPageHover.value,
                  text: 'Hakkımızda',
                  routeName: '/about',
                  onHover: (hover) {
                    appBarController.setAboutPageHover(hover ?? false);
                  },
                  onTap: onAboutPressed, // Add onTap for navigation
                ),
                _buildVerticalDivider(),
                NavItem(
                  isHover: appBarController.servicesPageHover.value,
                  text: 'Hizmetlerimiz',
                  routeName: '/services',
                  onHover: (hover) {
                    appBarController.setServicesPageHover(hover ?? false);
                  },
                  onTap: onServicesPressed, // Add onTap for navigation
                ),
                _buildVerticalDivider(),
                NavItem(
                  isHover: appBarController.contactPageHover.value,
                  text: 'İletişim',
                  routeName: '/contact',
                  onHover: (hover) {
                    appBarController.setContactPageHover(hover ?? false);
                  },
                  onTap: onContactPressed, // Add onTap for navigation
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  SizedBox _buildVerticalDivider() {
    return const SizedBox(
      height: 15,
      child: VerticalDivider(
        width: 20,
        thickness: 1,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 1.5);
}
