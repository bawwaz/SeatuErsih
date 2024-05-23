import 'package:get/get.dart';
import 'package:seatu_ersih/database/seatuersihLogin.dart';

class LoginPageController extends GetxController {
  final Login loginService = Login();

  var isLoading = false.obs;
  var username = ''.obs;
  var password = ''.obs;

  void loginUser() async {
    isLoading.value = true;

    final data = {
      'username': username.value,
      'password': password.value,
    };

    try {
      await loginService.loginUser(data);
      // Handle success response
      Get.snackbar('Success', 'User logged in successfully');
    } catch (e) {
      // Handle error
      print('Network error: $e');
      Get.snackbar('Error', 'Failed to log in user');
    } finally {
      isLoading.value = false;
    }
  }
}
