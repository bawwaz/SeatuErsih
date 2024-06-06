import 'package:get/get.dart';
import 'package:seatu_ersih/app/router/app_pages.dart';

class checkoutAnimationController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 2), () {
      Get.toNamed(Routes.BTMNAVBAR);
    });
  }
}
