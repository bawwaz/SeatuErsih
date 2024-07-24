import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class HomePageController extends GetxController {
  var isLoading = false.obs;
  final orders = [].obs;

  // GetStorage
  final box = GetStorage();

  Future<void> fetchOrder() async {
    isLoading.value = true;
    final url = 'http://seatuersih.pradiptaahmad.tech/api';
    final token = box.read('token');
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      final response =
          await http.get(Uri.parse('$url/order/get'), headers: headers);

      if (response.statusCode == 200) {
        final data = json.decode(response.body)['data'];
        orders.assignAll(data);
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

  String formatDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    String formattedDate = "${dateTime.day}/${dateTime.month}/${dateTime.year}";
    return formattedDate;
  }

  String formatPrice(String price) {
    if (price == 'null') {
      return 'N/A';
    } else {
      int intPrice = int.tryParse(price) ?? 0;
      String formattedPrice =
          NumberFormat.currency(locale: 'id_ID', symbol: 'Rp').format(intPrice);
      return formattedPrice;
    }
  }

  

  @override
  void onInit() {
    fetchOrder();
    super.onInit();
  }
}
