import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:seatu_ersih/app/router/app_pages.dart';

class LoginPageController extends GetxController {
  var isObsecure = true.obs;

  var email = ''.obs;
  var password = ''.obs;

  var isLoading = false.obs;
  GetStorage box = GetStorage();

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
        final user = json.decode(response.body)['user'];
      
        box.write("token", token);
        box.write("username", user['username']);

        Get.snackbar(
          "Login Successful",
          "Welcome ${user['username']}",
          snackPosition: SnackPosition.TOP,
        );
        isLoading.value = false;
        Get.offNamed(Routes.PROFILE);
      } else {
        final message =
            json.decode(response.body)['message'] ?? 'Unknown error';
        Get.snackbar(
          "Login Failed",
          message,
          snackPosition: SnackPosition.TOP,
        );
        isLoading.value = false;
      }
    } catch (e) {
      Get.snackbar(
        "Login Failed",
        "An error occurred. Please try again.",
        snackPosition: SnackPosition.TOP,
      );
      isLoading.value = false;
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
