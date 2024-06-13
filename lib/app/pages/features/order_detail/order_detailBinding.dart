import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/order_detail/order_detailController.dart';

class orderDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderDetailcontroller>(() => OrderDetailcontroller());
  }
}
