import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/profile_page/profileController.dart';

class profileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
