import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/order_booking_regular/order_booking_regular_controller.dart';

class CheckoutController extends GetxController {
  dynamic arguments;
  final shoess = [].obs;
  final OrderBookingRegularController orderBookingRegularController =
      Get.find();

  RxList<Map<String, dynamic>> shoes = <Map<String, dynamic>>[].obs;
  var pickupDate = ''.obs;
  RxString notes = ''.obs;
  RxInt totalPrice = 0.obs;

  @override
  void onInit() {
    arguments = Get.arguments;
    shoess.value = arguments[0];
    pickupDate.value = arguments[1];
    print(pickupDate.value);
    super.onInit();
    fetchOrderDetails();
  }

  void fetchOrderDetails() {
    shoes.value =
        List<Map<String, dynamic>>.from(orderBookingRegularController.shoes);
    // pickupDate.value = orderBookingRegularController.pickupDateController.text;
    notes.value = orderBookingRegularController.notes.value;

    totalPrice.value = calculateTotalPrice();
  }

  int calculateTotalPrice() {
    return shoes.length * 25000;
  }

  void clearData() {
    shoes.clear();
    pickupDate.value = '';
    notes.value = '';
    totalPrice.value = 0;
  }
}
