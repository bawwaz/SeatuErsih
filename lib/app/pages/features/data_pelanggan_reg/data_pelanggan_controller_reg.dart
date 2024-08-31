import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:seatu_ersih/app/api/api_endpoint.dart';

class DataPelangganRegController extends GetxController {
  var detail_address = "".obs;
  var phone = "".obs;
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
    final url = ApiEndpoint.baseUrl + '/order/add';
    final token = box.read('token');
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var data = {
      'detail_address': detail_address.value,
      'phone': phone.value,
      'total_price': total_price.value,
      'pickup_date': pickup_date.value,
      'notes': notes.value,
      'shoes_id': shoesId.value,
      'user_id': userId.value,
      'laundry_id': laundry_id.value,
    };

    try {
      final response = await http.post(Uri.parse(url),
          headers: headers, body: json.encode(data));

      if (response.statusCode == 201) {
        print('success');
        orders.assignAll(json.decode(response.body));
        return true;
      } else {
        print(response.body);
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
