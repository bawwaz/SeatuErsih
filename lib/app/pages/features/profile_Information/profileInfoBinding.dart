import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/profile_Information/profileInfoController.dart';

class profileInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => profileInfoController());
  }
}
