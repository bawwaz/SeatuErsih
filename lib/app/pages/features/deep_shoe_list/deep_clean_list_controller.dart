import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class DeepCleanController extends GetxController {
  var isLoading = false.obs;
  final shoes = [].obs;
  late final int orderId;

  final box = GetStorage();
  Future<void> fetchShoes() async {
    final order_id = box.read('order_id');
    isLoading.value = true;

    final url = 'http://seatuersih.xyz/api';
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
        shoes.assignAll(data);
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

  String formatPrice(int price) {
    String formattedPrice =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp').format(price);
    return formattedPrice;
  }

  Future<void> deleteShoes(int id) async {
    final url = 'http://seatuersih.pradiptaahmad.tech/api';
    final token = box.read('token');
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      final response = await http.delete(Uri.parse('$url/shoe/delete/$id'),
          headers: headers);

      if (response.statusCode == 200) {
        fetchShoes();
        Get.snackbar("Success", "Shoes deleted successfully");
      } else {
        print('Failed to delete shoes: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to delete shoes');
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  void clearShoes() {
    shoes.clear();
  }

  @override
  void onInit() {
    fetchShoes();
    orderId = Get.arguments[0];

    super.onInit();
  }

  @override
  void onClose() {
    clearShoes();
    super.onClose();
  }
}
