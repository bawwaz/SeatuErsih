import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:seatu_ersih/app/api/api_endpoint.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentConfirmationController extends GetxController {
  final box = GetStorage();
  var orderId = 0;

  var isLoading = false.obs;
  var shoeData = <Map<String, dynamic>>[].obs;
  var orderData = {}.obs;
  String? checkoutLink; // Add a variable to store checkoutLink
  String errorMessage = ''; // Variable to store the error message

  @override
  void onInit() {
    orderId = Get.arguments['regList'] ??
        Get.arguments['deepList'] ??
        Get.arguments['orderStatus'];
    fetchShoe();
    super.onInit();
  }

  Future<void> fetchShoe() async {
    isLoading.value = true;
    final url = ApiEndpoint.baseUrl;
    final token = box.read('token');
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      final response = await http.get(
        Uri.parse('$url/shoe/getshoe/$orderId'),
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
    final url = ApiEndpoint.baseUrl;
    final token = box.read('token');
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var body = {
      'order_id': orderId.toString(),
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

  String formatPrice(int? price) {
    if (price == null) {
      return NumberFormat.currency(locale: 'id_ID', symbol: 'Rp').format(0);
    }
    return NumberFormat.currency(locale: 'id_ID', symbol: 'Rp').format(price);
  }

  Future<bool> createPayment() async {
    // final url = 'http://seatuersih.pradiptaahmad.tech/api/payment/create';
    final url = ApiEndpoint.baseUrl;
    final token = box.read('token');
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    var body = json.encode({
      'order_id': orderId,
    });

    try {
      final response = await http.post(
        Uri.parse('$url/payment/create'),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Handle both 200 OK and 201 Created
        final responseData = json.decode(response.body);

        if (responseData['status'] == 'success') {
          final checkoutLink = responseData['checkout_link'];
          this.checkoutLink = checkoutLink;
          return true;
        } else {
          errorMessage = responseData['message'] ?? 'Unknown error';
          print('Payment creation failed: $errorMessage');
          print('Response body: ${response.body}');
          return false;
        }
      } else {
        errorMessage =
            'Failed to create payment. Status code: ${response.statusCode}. Response body: ${response.body}';
        print(errorMessage);
        return false;
      }
    } catch (e) {
      errorMessage = 'Exception occurred: $e';
      print(errorMessage);
      return false;
    }
  }

  Future<void> updateOrderStatus(String orderId, String status) async {
    // final url = 'http://seatuersih.pradiptaahmad.tech/api/order/update';
    final url = ApiEndpoint.baseUrl;
    final token = box.read('token');
    var headers = {
      "Accept": "application/json",
      "Authorization": "Bearer $token",
      "Content-Type": "application/json"
    };

    var body = json.encode({
      'id': orderId,
      'order_status': status,
    });

    try {
      final response = await http.post(
        Uri.parse('$url/order/update'),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        print('Order status updated successfully.');
      } else {
        print('Failed to update order status: ${response.body}');
      }
    } catch (e) {
      print('Exception occurred while updating order status: $e');
    }
  }

  Future<void> proceedToPayment(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
    } else {
      print('could not launch $url');
    }
  }
}
