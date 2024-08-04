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

      if (response.statusCode == 200) {
        final token = json.decode(response.body)['token'];
        final userData = json.decode(response.body)['user'];

        box.write("token", token);
        box.write("username", userData['username']);
        box.write("userid", userData['id']);
        await FirebaseMessaging.instance.requestPermission();
        final fcmToken = await FirebaseMessaging.instance.getToken();
        print('token : $fcmToken');
        user.value = userData; // Store user data

        Get.snackbar(
          "Login Successful",
          "Welcome ${userData['username']}",
          snackPosition: SnackPosition.TOP,
        );
        isLoading.value = false;
        Get.offNamed(Routes.BTMNAVBAR);
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

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
