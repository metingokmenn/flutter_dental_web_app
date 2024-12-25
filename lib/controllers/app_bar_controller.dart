import 'package:get/get.dart';

class AppBarController extends GetxController {
  var homePageHover = RxBool(false);
  var aboutPageHover = RxBool(false);
  var servicesPageHover = RxBool(false);
  var contactPageHover = RxBool(false);

  void setHomePageHover(bool isHovering) {
    homePageHover.value = isHovering;
  }

  void setAboutPageHover(bool isHovering) {
    aboutPageHover.value = isHovering;
  }

  void setServicesPageHover(bool isHovering) {
    servicesPageHover.value = isHovering;
  }

  void setContactPageHover(bool isHovering) {
    contactPageHover.value = isHovering;
  }
}
