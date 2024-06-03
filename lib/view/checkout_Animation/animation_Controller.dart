import 'package:get/get.dart';
import 'package:seatu_ersih/view/Home_Page/HomepageView.dart';

class NavigationController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAll(() => const HomePage());
    });
  }
}
