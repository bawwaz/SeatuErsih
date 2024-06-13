import 'package:get/get.dart';
import 'package:seatu_ersih/app/router/app_pages.dart';

class CheckoutAnimationController extends GetxController {

  var text = "assets/img/success.json".obs;
  @override
  void onInit() {
    print("konoshojh");
    Future.delayed(Duration(seconds: 2), () {
      Get.offAllNamed(Routes.BTMNAVBAR);
    });
    super.onInit();
  }
}
