import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class PaymentConfirmationController extends GetxController{
  final box = GetStorage();
  late final order_id;

  // Declare variable
  var isLoading = false.obs;
  var shoeData = [].obs;
  var orderData = {}.obs;
  late final arguments;

  // Fetch data from API
  Future<void> fetchShoe() async {
    isLoading.value = true;
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
      final response = await http.post(Uri.parse('$url/shoe/getall'),
          headers: headers, body: body);

      if (response.statusCode == 200) {
        final data = json.decode(response.body)['data'];
        shoeData.assignAll(data);
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
      final response = await http.post(Uri.parse('$url/order/checkout'),
          headers: headers, body: body);

      if (response.statusCode == 200) {
        final data = json.decode(response.body)['order'];
        orderData.assignAll(data);
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
    String formattedPrice =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp').format(price);
    return formattedPrice;
  }

  @override
  void onInit() {
    order_id = box.read('order_id');
    fetchShoe();
    super.onInit();
  }
}