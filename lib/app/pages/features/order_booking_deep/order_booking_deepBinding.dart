import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/order_booking_deep/order_booking_deep_controller.dart';

class orderBookingDeepBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderBookingDeepController());
  }

}