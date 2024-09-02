import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:seatu_ersih/app/api/api_endpoint.dart';

class DataPelangganControllerDeep extends GetxController {
  var detail_address = "".obs;
  var total_price = 0.obs;
  var pickup_date = "".obs;
  var notes = ''.obs;
  var shoesId = 0.obs;
  var userId = 0.obs;
  var laundry_id = 0.obs;

  var isOtherSelected = false.obs;
  var kabupatenName = "".obs;
  var kecamatanName = "".obs;

  final box = GetStorage();
  final orders = {}.obs;
  final kabupaten = [].obs;
  final kecamatan = [].obs;

  // Fetch Kabupaten
  Future<void> fetchKabupaten() async {
    final url = ApiEndpoint.baseUrl;
    final token = box.read('token');
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      final response =
          await http.get(Uri.parse('$url/kabupaten/getall'), headers: headers);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data != null && data['data'] != null) {
          kabupaten.assignAll(data['data']);
          print('Kabupaten found: ${data['data']}');
        } else {
          print('No kabupaten found');
        }
      } else {
        print('Failed to fetch kabupaten: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to fetch kabupaten');
      }
    } catch (e) {
      print(e);
    }
  }

  // Fetch Kecamatan by Kabupaten ID
  Future<void> fetchKecamatanByKabupatenId(int kabupatenId) async {
    final url = ApiEndpoint.baseUrl;
    final token = box.read('token');
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      final response = await http.get(
          Uri.parse('$url/kecamatan/get-kecamatan-kabupatenid/$kabupatenId'),
          headers: headers);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        kecamatan.assignAll(data['data']);
      } else {
        throw Exception('Failed to fetch kecamatan');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    fetchKabupaten();
    super.onInit();
  }

  Future<void> pickDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      pickup_date.value = picked.toString().split(' ')[0];
    }
  }

  Future<bool> postOrders() async {
    // Debugging: Print values before sending
    print('Order Type: deep_clean');
    print('Detail Address: ${detail_address.value}');
    print('Total Price: ${total_price.value}');
    print('Pickup Date: ${pickup_date.value}');
    print('Notes: ${notes.value}');
    print('Shoes ID: ${shoesId.value}');
    print('User ID: ${userId.value}');
    print('Laundry ID: ${laundry_id.value}');
    print('Kabupaten: ${kabupatenName.value}');
    print('Kecamatan: ${kecamatanName.value}');

    // Validation checks
    if (detail_address.value.isEmpty ||
        pickup_date.value.isEmpty ||
        kabupatenName.value.isEmpty ||
        kecamatanName.value.isEmpty) {
      print('Please fill in all required fields.');
      return false;
    }

    final url = 'http://seatuersih.pradiptaahmad.tech/api/order/add';
    final token = box.read('token');
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var data = {
      'detail_address': detail_address.value,
      'total_price': total_price.value.toString(),
      'pickup_date': pickup_date.value,
      'user_id': box.read('userid').toString(),
      'notes': notes.value,
      'laundry_id': Get.arguments.toString(),
      'order_type': 'deep_clean',
      'kabupaten': kabupatenName.value,
      'kecamatan': kecamatanName.value,
    };

    try {
      final response =
          await http.post(Uri.parse(url), headers: headers, body: data);
      print('Response Status: ${response.statusCode}');
      if (response.statusCode == 201) {
        print('Order placed successfully');
        orders.value = json.decode(response.body)['order'];
        box.write('order_id', orders['id'].toString());
        return true;
      } else {
        print('Error: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Exception: $e');
      return false;
    }
  }
}
