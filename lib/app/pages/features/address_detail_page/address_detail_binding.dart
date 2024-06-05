import 'package:get/get.dart';

class AddressDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddressDetailBinding>(() => AddressDetailBinding());
  }
}
