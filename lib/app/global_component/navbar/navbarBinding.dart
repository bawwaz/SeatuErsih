import 'package:get/get.dart';
import 'package:seatu_ersih/app/global_component/navbar/btmnavcontroller.dart';

class navbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavigationController());
  }
}
