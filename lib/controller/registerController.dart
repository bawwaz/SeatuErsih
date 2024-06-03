import 'dart:ffi';

import 'package:get/get.dart';
import 'package:seatu_ersih/database/seatuersihRegister.dart';
import 'package:seatu_ersih/routes/routes.dart';

class AuthController extends GetxController {
  final ApiService apiService = ApiService();

  var isLoading = false.obs;
  var username = ''.obs;
  var email = ''.obs;
  var phone = ''.obs;
  var password = ''.obs;
  var checked = false.obs;

  void registerUser() async {
    isLoading.value = true;

    final data = {
      'username': username.value,
      'phone': phone.value,
      'email': email.value,
      'password': password.value,
    };

    try {
      await apiService.registerUser(data);
      // Handle success response
      Get.snackbar('Success', 'User registered successfully');
      Get.offNamed(Routes.btmnavbar);
    } catch (e) {
      // Handle error
      print('Network error: $e');
      Get.snackbar('Error', 'Failed to register user');
    } finally {
      isLoading.value = false;
    }
  }
}
