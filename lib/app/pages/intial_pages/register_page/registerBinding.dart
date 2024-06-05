import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/intial_pages/register_page/registerController.dart';

class RegisterPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterPageController>(() => RegisterPageController());
  }
}
