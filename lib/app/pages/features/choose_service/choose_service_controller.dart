import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ChooseServiceController extends GetxController {
  var laundries = <Map<String, dynamic>>[].obs;
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    fetchLaundries();
  }

  Future<void> fetchLaundries() async {
    final token = box.read('token');

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final response = await http.get(
        Uri.parse('http://seatuersih.pradiptaahmad.tech/api/laundry/getall'),
        headers: headers);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data['laundries'] != null && data['laundries'] is List) {
        laundries.value = List<Map<String, dynamic>>.from(data['laundries']);
      }
      print(laundries);
    } else {
      print('Error: ${response.statusCode}');
    }
  }

  Future<void> orderLaundry(int laundryId) async {
    final token = box.read('token');
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    print('Memesan laundry dengan id: $laundryId');
    final response = await http.get(
      Uri.parse(
          'http://seatuersih.pradiptaahmad.tech/api/laundry/get/$laundryId'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      // Penanganan sukses
      print('Sukses: ${response.body}');
      Get.snackbar('Sukses', 'Pesanan Anda telah diterima');
    } else {
      // Penanganan error
      print('Error: ${response.statusCode}');
      print('Isi respon: ${response.body}');
      Get.snackbar('Error', 'Gagal memesan: ${response.statusCode}');
    }
  }
}
