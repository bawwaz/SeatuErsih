import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/available_coupons_page/available_coupons_controller.dart';

class AvailableCouponBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AvailableCouponController>(() => AvailableCouponController());
  }
}
