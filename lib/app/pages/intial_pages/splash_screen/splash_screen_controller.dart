import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:seatu_ersih/app/router/app_pages.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    var token = GetStorage().read('token');

    if (token != null && token.isNotEmpty) {
      return Future.delayed(
        Duration(seconds: 3),
        () {
          Get.offNamed(Routes.BTMNAVBAR);
        },
      );
    } else {
      return Future.delayed(
        Duration(seconds: 3),
        () {
          Get.offNamed(Routes.LOGIN);
        },
      );
    }
  }
}
