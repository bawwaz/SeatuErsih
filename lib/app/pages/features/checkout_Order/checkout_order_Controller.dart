import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:seatu_ersih/app/pages/features/order_booking_regular/order_booking_regular_controller.dart';
import 'package:http/http.dart' as http;

class CheckoutController extends GetxController {
  dynamic arguments;
  final shoess = [].obs;
  final OrderBookingRegularController orderBookingRegularController =
      Get.find();

  RxList<Map<String, dynamic>> shoes = <Map<String, dynamic>>[].obs;
  var pickupDate = ''.obs;
  RxString notes = ''.obs;
  RxInt totalPrice = 0.obs;

  final orders = {}.obs;

  var isLoading = false.obs;

  final url = 'http://seatuersih.pradiptaahmad.tech/api';

  final box = GetStorage();
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

  Future<void> createOrder() async {
    isLoading.value = true;
    final token = box.read('token');
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      var response =
          await http.post(Uri.parse('$url/order/add'), headers: headers, body: {
        'notes': arguments[2].toString(),
        'pickup_date': pickupDate.value,
        'estimated_time': '2024/06/10',
        'price': totalPrice.value,
        'user_id': 2,
        'shoes_id': 1,
        'address_id': 1,
        'product_id': 1,
      });

      if (response.statusCode == 201) {
        final jsonData = json.decode(response.body)['order'];
        orders.value = jsonData;
        addShoes();
        isLoading.value = false;
      } else {
        Get.snackbar("Gagal Order", "Order Gagal Dibuat");
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to create order');
    }
  }

  Future<void> addShoes() async {
    final token = box.read('token');

    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      shoess.forEach((shoes) async {
        var body = jsonEncode({
          'name': shoes['name'],
          'addons': shoes['addons'],
          'order_id': orders['id'],
        });

        final response = await http.post(
          Uri.parse('$url/shoe/add'),
          headers: headers,
          body: body,
        );

        if (response.statusCode == 200) {
          print('Shoes added successfully');
        } else {
          print('Failed to add shoes: ${response.statusCode}');
          print('Response body: ${response.body}');
          throw Exception('Failed to add shoes');
        }
      });
    } catch (e) {
      throw Exception('Failed to add shoes');
    }
  }

  void clearData() {
    shoes.clear();
    pickupDate.value = '';
    notes.value = '';
    totalPrice.value = 0;
  }
}
