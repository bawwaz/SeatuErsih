import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:seatu_ersih/app/api/api_endpoint.dart';

class DataPelangganControllerDeep extends GetxController {
  var detail_address = "".obs;
  var phone = "".obs;
  var total_price = 0.obs;
  var pickup_date = "".obs;
  var notes = ''.obs;
  var shoesId = 0.obs;
  var userId = 0.obs;

  var isOtherSelected = false.obs;
  var kabupatenName = "".obs;
  var kecamatanName = "".obs;

  final box = GetStorage();
  final orders = {}.obs;
  final kabupaten = [].obs;
  final kecamatan = [].obs;
  final filteredKecamatan = [].obs;

  Future<bool> postOrders() async {
    final url = ApiEndpoint.baseUrl;
    final token = box.read('token');

    var data = {
      'laundry_id': Get.arguments.toString(),
      'order_type': 'deep_clean',
      'detail_address': detail_address.value,
      'phone': phone.value,
      'pickup_date': pickup_date.value.toString(),
      'notes': notes.value,
      'user_id': box.read('userid').toString(),
      'kabupaten': kabupatenName.value,
      'kecamatan': kecamatanName.value,
    };

    var headers = {
      "Accept": 'application/json',
      "Authorization": "Bearer $token"
    };

    try {
      print('Sending data: $data');
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
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      pickup_date.value = picked.toLocal().toString().split(' ')[0];
    }
  }

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
        if (data != null && data['data'] != null && data['data'] is List) {
          final List<dynamic> kabupatenList = data['data'] as List<dynamic>;
          kabupaten.assignAll(kabupatenList
              .map((item) => {
                    'id': item['id'],
                    'name': item['kabupaten'],
                  } as Map<String, dynamic>)
              .toList());
          print('Kabupaten found: $kabupaten');
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

  Future<void> fetchKecamatan() async {
    final url = ApiEndpoint.baseUrl;
    final token = box.read('token');
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      final response =
          await http.get(Uri.parse('$url/kecamatan/getall'), headers: headers);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data != null && data['data'] != null && data['data'] is List) {
          final List<dynamic> kecamatanList = data['data'] as List<dynamic>;
          kecamatan.assignAll(kecamatanList
              .map((item) => {
                    'id': item['id'],
                    'name': item['kecamatan'],
                  } as Map<String, dynamic>)
              .toList());
          print('Kecamatan found: $kecamatan');
        } else {
          print('No kecamatan found');
        }
      } else {
        print('Failed to fetch kecamatan: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to fetch kecamatan');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    fetchKabupaten();
    fetchKecamatan();
    super.onInit();
  }
}
