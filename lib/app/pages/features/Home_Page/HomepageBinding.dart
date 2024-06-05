import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/Home_Page/HomepageController.dart';

class homePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => homePageController());
  }
}
