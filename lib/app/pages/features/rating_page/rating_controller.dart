import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:seatu_ersih/app/api/api_endpoint.dart';
import 'dart:convert';

import 'package:seatu_ersih/app/router/app_pages.dart';

class RatingController extends GetxController {
  var rating = 0.0.obs;
  var review = ''.obs;
  var order_id = 0.obs;
  var order_type = ''.obs;
  var laundry_id = 0.obs;
  final box = GetStorage();

  Future<bool> postReview() async {
    final url = ApiEndpoint.baseUrl;
    final token = box.read('token');

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var body = json.encode({
      'rating': rating.value,
      'review': review.value,
      'order_id': order_id.value,
      'order_type': order_type.value,
      'laundry_id': laundry_id.value,
    });

    print('Posting review with body: $body');

    try {
      final response = await http.post(Uri.parse('$url/review/add'),
          headers: headers, body: body);
      if (response.statusCode == 201) {
        return true;
      } else {
        print('Failed to post review: ${response.statusCode}');
        print('Response body: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error posting review: $e');
      return false;
    }
  }

  Future<bool> updateOrderStatus() async {
    final url = '${ApiEndpoint.baseUrl}/order/update';
    final token = box.read('token');

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var body = json.encode({
      'id': order_id.value,
      'order_status': 'reviewed',
    });

    print('Updating order status with body: $body');

    try {
      final response = await http.post(Uri.parse(url),
          headers: headers, body: body);
      if (response.statusCode == 200) {
        print('Order status updated successfully');
        return true;
      } else {
        print('Failed to update order status: ${response.statusCode}');
        print('Response body: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error updating order status: $e');
      return false;
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
