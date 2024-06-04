import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/order_booking_regular/order_booking_regular_controller.dart';

class orderBookingRegularBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderBookingRegularController());
  }
}
