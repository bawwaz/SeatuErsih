import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:seatu_ersih/app/pages/features/payment_confirmation_page/widget/paymentweb_view.dart';

class PaymentConfirmationController extends GetxController {
  final box = GetStorage();
  late final String order_id;

  var isLoading = false.obs;
  var shoeData = <Map<String, dynamic>>[].obs;
  var orderData = {}.obs;
  String? checkoutLink; // Add a variable to store checkoutLink
  String errorMessage = ''; // Variable to store the error message

  @override
  void onInit() {
    order_id = Get.arguments[0].toString();
    fetchShoe();
    super.onInit();
  }

  Future<void> fetchShoe() async {
    isLoading.value = true;
    final url = 'http://seatuersih.pradiptaahmad.tech/api';
    final token = box.read('token');
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      final response = await http.get(
        Uri.parse('$url/shoe/getshoe/$order_id'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body)['data'];
        if (data is List) {
          shoeData.assignAll(data.cast<Map<String, dynamic>>());
        } else {
          throw Exception('Unexpected data format');
        }
        fetchOrders();
      } else {
        print('Failed to fetch shoes: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to fetch shoes');
      }
    } catch (e) {
      print(e);
    }

    isLoading.value = false;
  }

  Future<void> fetchOrders() async {
    final url = 'http://seatuersih.pradiptaahmad.tech/api';
    final token = box.read('token');
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var body = {
      'order_id': order_id.toString(),
    };

    try {
      final response = await http.post(
        Uri.parse('$url/order/checkout'),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body)['order'];
        orderData.assignAll(data);
        print('Order data fetched: $orderData');
      } else {
        print('Failed to fetch orders: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to fetch orders');
      }
    } catch (e) {
      print(e);
    }
  }

  String formatPrice(int price) {
    return NumberFormat.currency(locale: 'id_ID', symbol: 'Rp').format(price);
  }

  Future<bool> createPayment() async {
    final url = 'http://seatuersih.pradiptaahmad.tech/api/payment/create';
    final token = box.read('token');
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    var body = json.encode({
      'order_id': order_id,
      'amount': orderData['total_price'],
      // Include any other necessary fields based on Xendit API requirements
    });

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        if (responseData['status'] == 'success') {
          final checkoutLink = responseData['checkout_link'];
          this.checkoutLink = checkoutLink; // Store checkoutLink in controller
          return true;
        } else {
          // Extract and print error details from response
          errorMessage = responseData['message'] ?? 'Unknown error';
          print('Payment creation failed: $errorMessage');
          print('Response body: ${response.body}');
          return false;
        }
      } else {
        // Print general API error with response body
        errorMessage = 'Failed to create payment. Status code: ${response.statusCode}. Response body: ${response.body}';
        print(errorMessage);
        return false;
      }
    } catch (e) {
      // Handle and print exceptions
      errorMessage = 'Exception occurred: $e';
      print(errorMessage);
      return false;
    }
  }

  Future<void> proceedToPayment() async {
    bool paymentCreated = await createPayment();
    if (paymentCreated && checkoutLink != null) {
      Get.to(() => PaymentWebView(url: checkoutLink!)); // Pass checkoutLink
    } else {
      Get.snackbar("Error", errorMessage.isNotEmpty ? errorMessage : "Failed to create payment. Please try again.");
    }
  }
}
