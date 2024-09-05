import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:seatu_ersih/app/router/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpPageController extends GetxController {
  var focusNodes = List.generate(6, (_) => FocusNode()).obs;
  var controllers = List.generate(6, (_) => TextEditingController()).obs;
  var isFocused = List.generate(6, (_) => false.obs);

  static const String Url =
      'http://seatuersih.pradiptaahmad.tech/api'; // URL server Anda

  @override
  void onClose() {
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    for (var controller in controllers) {
      controller.dispose();
    }
    super.onClose();
  }

  void updateFocus(int index, bool value) {
    isFocused[index].value = value;
  }

  Future<void> verifyOtp(String pinCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var data = {
      'otp': pinCode,
    };

    try {
      final response = await http.post(
        Uri.parse('$Url/users/verify-otp'),
        headers: headers,
        body: data,
      );

      if (response.statusCode == 200) {
        Get.snackbar("Berhasil", "Kode OTP berhasil diverifikasi",
            snackPosition: SnackPosition.TOP, backgroundColor: Colors.green);
        Get.offAllNamed(Routes.BTMNAVBAR);
      } else {
        Get.snackbar(
            "Gagal ${response.statusCode}", "Kode OTP gagal diverifikasi",
            snackPosition: SnackPosition.TOP, backgroundColor: Colors.red);
      }
    } catch (e) {
      Get.snackbar("Gagal", e.toString(),
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.red);
      print(e);
    }
  }
}
