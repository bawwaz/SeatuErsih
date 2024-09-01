import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/intial_pages/splash_screen/splash_screen_controller.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashScreenController>(SplashScreenController());
  }
}
