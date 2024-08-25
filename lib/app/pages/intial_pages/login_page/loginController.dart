import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:seatu_ersih/app/router/app_pages.dart';

class LoginPageController extends GetxController {
  var isObsecure = true.obs;
  var isPasswordHidden = true.obs;

  var email = ''.obs;
  var password = ''.obs;

  var isLoading = false.obs;
  GetStorage box = GetStorage();

  var user = {}.obs;

  @override
  void onInit() {
    super.onInit();
    
    _checkAutoLogin();
  }

  Future<void> _checkAutoLogin() async {
    final token = box.read("token");
    if (token != null) {
      // If there's a token, try to auto-login
      await _fetchUserData(token);
    }
  }

  Future<void> _fetchUserData(String token) async {
    final url =
        'http://seatuersih.pradiptaahmad.tech/api/users/me'; // Adjust endpoint if necessary
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      var response = await http.get(
        Uri.parse(url),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final userData = json.decode(response.body)['user'];
        user.value = userData; // Store user data

        Get.offNamed(Routes.BTMNAVBAR); // Navigate to the main page
      } else {
        // Token might be invalid, clear storage
        box.remove("token");
        box.remove("username");
        box.remove("userid");
      }
    } catch (e) {
      // Handle exceptions
      box.remove("token");
      box.remove("username");
      box.remove("userid");
    }
  }

  Future<void> login() async {
    isLoading.value = true;
    final url = 'http://seatuersih.pradiptaahmad.tech/api';
    var data = {
      'email': email.value,
      'password': password.value,
    };
    var headers = {
      'Accept': 'application/json',
    };

    try {
      var response = await http.post(
        Uri.parse("$url/users/login"),
        headers: headers,
        body: data,
      );

      print('Login response status: ${response.statusCode}');
      print('Login response body: ${response.body}');

      if (response.statusCode == 200) {
        final token = json.decode(response.body)['token'];
        final userData = json.decode(response.body)['user'];

        print('Token: $token');
        print('User data: $userData');

        box.write("token", token);
        box.write("username", userData['username']);
        box.write("userid", userData['id']);
        await FirebaseMessaging.instance.requestPermission();
        final fcmToken = await FirebaseMessaging.instance.getToken();
        print('FCM Token: $fcmToken');
        user.value = userData; // Store user data

        Get.snackbar(
          "Login Successful",
          "Welcome ${userData['username']}",
          snackPosition: SnackPosition.TOP,
        );
        isLoading.value = false;
        Get.offAllNamed(
            Routes.BTMNAVBAR); // Use offAllNamed to ensure navigation
      } else {
        final message =
            json.decode(response.body)['message'] ?? 'Unknown error';
        Get.snackbar(
          "Login Failed",
          message,
          snackPosition: SnackPosition.TOP,
        );
        isLoading.value = true;
      }
    } catch (e) {
      Get.snackbar(
        "Login Failed",
        "$e",
        snackPosition: SnackPosition.TOP,
      );
      isLoading.value = true;
    }
  }
}
