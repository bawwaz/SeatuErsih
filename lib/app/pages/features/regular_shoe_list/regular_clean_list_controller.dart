import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class RegCleanListController extends GetxController{
  var isLoading = false.obs;
  final shoes = [].obs;

  final box = GetStorage();
  Future<void> fetchShoes() async {
    final order_id = box.read('order_id');
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

  @override
  void onInit() {
    fetchShoes();
    super.onInit();
  }
}