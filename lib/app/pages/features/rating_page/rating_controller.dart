import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class RatingController extends GetxController {
  var rating = 0.0.obs;
  var review = ''.obs;
  var order_id = 0.obs;

  final box = GetStorage();

  Future<bool> postReview() async {
    final url = 'http://seatuersih.pradiptaahmad.tech/api/review/add';
    final token = box.read('token');

    var data = {
      'rating': rating.value.toString(),
      'review': review.value,
      'order_id': order_id.value.toString(),
    };

    var headers = {
      "Accept": 'application/json',
      "Content-Type": 'application/json',
      "Authorization": "Bearer $token"
    };

    try {
      print('Sending data: $data'); 
      var response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: json.encode(data),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 201) {
        // Handle success response
        return true;
      } else {
        Get.snackbar('Error', 'Failed to submit review: ${response.body}');
        return false;
      }
    } catch (e) {
      Get.snackbar('Error', 'Exception occurred: $e');
      return false;
    }
  }
}
