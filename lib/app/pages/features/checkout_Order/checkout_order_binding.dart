import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/checkout_Order/checkout_order_Controller.dart';

class checkoutOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<checkoutController>(() => checkoutController());
  }
}
