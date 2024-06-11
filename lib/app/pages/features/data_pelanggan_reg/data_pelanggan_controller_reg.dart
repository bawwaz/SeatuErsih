import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:seatu_ersih/app/router/app_pages.dart';

class DataPelangganRegController extends GetxController {
  var address = "".obs;
  var phone = "".obs;
  var total_price = 0.obs;
  var pickup_date = "".obs;
  var notes = ''.obs;
  var shoesId = 0.obs;
  var userId = 0.obs;

  final box = GetStorage();
  final orders = {}.obs;

  Future<bool> postOrders() async {
    final url = 'http://seatuersih.pradiptaahmad.tech/api';
    final token = box.read('token');
    var data = {
      'order_type': 'regular_clean',
      'address': address.value,
      'phone': phone.value,
      'pickup_date': pickup_date.value.toString(),
      'notes': notes.value,
      'userId': userId.value.toString(),
    };

    var headers = {
      "Accept": 'application/json',
      "Authorization": "Bearer $token"
    };

    try {
      print('Sending data: $data'); // Log the data being sent
      var response = await http.post(
        Uri.parse("$url/order/add"),
        headers: headers,
        body: data,
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 201) {
        orders.value = json.decode(response.body)['order'];
        box.write('order_id', orders['id'].toString());
        return true;
      } else {
        Get.snackbar('Error', 'Failed to submit data: ${response.body}');
        return false;
      }
    } catch (e) {
      Get.snackbar('Error', 'Exception occurred: $e');
      return false;
    }
  }

  Future<void> pickDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      pickup_date.value = picked.toLocal().toString().split(' ')[0];
    }
  }
}
