import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPageController extends GetxController {
  final String baseUrl = 'http://seatuersih.pradiptaahmad.tech/api';
  var isLoading = false.obs;
  var username = ''.obs;
  var password = ''.obs;

  void loginUser() async {
    isLoading.value = true;

    final data = {
      'email': username.value,
      'password': password.value,
    };

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/Users/login'),
        body: json.encode(data),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Handle success
        var responseBody = json.decode(response.body);
        Get.snackbar('Success', 'User logged in successfully');
        print('User details: ${responseBody['user']}');
        print('Token: ${responseBody['token']}');
        // Navigate to home page
        Get.offNamed('/home');
      } else {
        // Handle error
        var responseBody = json.decode(response.body);
        print('Failed to log in user: ${response.statusCode}');
        print('Response body: ${response.body}');

        if (response.statusCode == 400) {
          Get.snackbar('Error', 'Invalid username or password');
        } else if (response.statusCode == 401) {
          Get.snackbar('Error', 'Unauthorized access');
        } else if (responseBody.containsKey('message')) {
          Get.snackbar('Error', responseBody['message']);
        } else {
          Get.snackbar('Error', 'Failed to log in user');
        }
      }
    } catch (e) {
      // Handle network error
      print('Network error: $e');
      Get.snackbar('Error', 'Failed to log in user');
    } finally {
      isLoading.value = false;
    }
  }
}
