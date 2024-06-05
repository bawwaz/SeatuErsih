import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/saved_address_page/saved_address_controller.dart';

class SavedAddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SavedAddressController>(() => SavedAddressController());
  }
}
