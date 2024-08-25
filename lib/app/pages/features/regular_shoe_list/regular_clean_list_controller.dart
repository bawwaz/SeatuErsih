import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class RegCleanListController extends GetxController {
  var isLoading = false.obs;
  final shoes = <Map<dynamic, dynamic>>[].obs;
  final box = GetStorage();

  late final int orderId;

  @override
  void onInit() {
    orderId = Get.arguments[0];
    fetchShoes();
    super.onInit();
  }

  Future<void> fetchShoes() async {
    isLoading.value = true;

    final url = 'http://seatuersih.pradiptaahmad.tech/api';
    final token = box.read('token');
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      // Fetch shoes based on orderId
      final response = await http.get(
        Uri.parse('$url/shoe/getshoe/$orderId'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body)['data'];
        if (data is List) {
          shoes.assignAll(data.cast<Map<dynamic, dynamic>>());
        } else {
          throw Exception('Unexpected data format');
        }
      } else {
        print('Failed to fetch shoes: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to fetch shoes');
      }
      print(shoes);
    } catch (e) {
      print(e);
    }

    isLoading.value = false;
  }

  String formatPrice(int price) {
    return NumberFormat.currency(locale: 'id_ID', symbol: 'Rp').format(price);
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
  void onClose() {
    clearShoes();
    super.onClose();
  }
}
