import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/Home_Page/HomepageView.dart';

class checkoutAnimationController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAll(() => const HomePage());
    });
  }
}
