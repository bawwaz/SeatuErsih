import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyShoeController extends GetxController {
  var isLoading = false.obs;
  var shoeData = [].obs;
  final box = GetStorage();

  Future<void> fetchShoebyId(int id) async {
    isLoading.value = true;
    final url = 'http://seatuersih.pradiptaahmad.tech/api';
    final token = box.read('token');

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      final response = await http.get(Uri.parse('$url/shoe/getshoe/$id'), headers: headers);

      if (response.statusCode == 200) {
        var data = json.decode(response.body)['data'];
        shoeData.value = data;
      } else {
        // Handle error response
        print('Failed to load shoes');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
