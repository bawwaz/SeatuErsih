import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/add_address_page/add_address_controller.dart';

class AddAddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddAddressController>(() => AddAddressController());
  }
}
