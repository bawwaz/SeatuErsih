import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/intial_pages/login_page/loginController.dart';

class LoginPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginPageController());
  }
}
