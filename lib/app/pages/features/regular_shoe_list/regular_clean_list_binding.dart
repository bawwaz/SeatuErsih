import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/regular_shoe_list/regular_clean_list_controller.dart';

class RegCleanListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegCleanListController>(() => RegCleanListController());
  }
}
