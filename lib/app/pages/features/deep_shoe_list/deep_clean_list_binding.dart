import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/deep_shoe_list/deep_clean_list_controller.dart';

class DeepCleanListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeepCleanController>(() => DeepCleanController());
  }
}
