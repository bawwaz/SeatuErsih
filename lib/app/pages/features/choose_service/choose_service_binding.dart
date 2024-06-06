import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/choose_service/choose_service_controller.dart';

class ChooseServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChooseServiceController>(() => ChooseServiceController());
  }

}