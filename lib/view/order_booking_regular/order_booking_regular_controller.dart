import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
class OrderBookingRegularController extends GetxController {
  var checked = false.obs;

  get selectedIndex => null;

  final List<RxBool> checkedkotoll = List.generate(4, (index) => false.obs);

  final url = "http://seatuersih.pradiptaahmad.tech/api";

  final box = GetStorage();

  final List<dynamic> shoes = [].obs;

  var shoesName = "".obs;

  Future<void> addShoes(String name, String addons, String orderId) async {
    final token = box.read('token');
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var body = jsonEncode({
      'name': name,
      'addons': addons,
      'order_id': orderId,
    });

    try {
      final response = await http.post(
        Uri.parse('$url/shoe/add'),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        print('Shoes added successfully');
        getShoes(); // Assuming getShoes is defined elsewhere in your code
      } else {
        print('Failed to add shoes: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to add shoes');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getShoes() async {
    final token = box.read('token');

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    try {
      final response =
          await http.get(Uri.parse("$url/shoe/all"), headers: headers);

      if (response.statusCode == 200) {
        final data = json.decode(response.body)['data'];
        for (var item in data) {
          shoes.add({
            'name': item['name'],
            'addons': item['addons'],
            'order_id': item['order_id'],
          });
        }
      } else {
        print('Failed to fetch shoes: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to fetch shoes');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getShoes();
    super.onInit();
  }
}
