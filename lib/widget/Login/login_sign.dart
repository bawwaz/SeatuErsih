import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih/controller/loginController.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginPageController>();

    return Obx(() => ElevatedButton(
        onPressed: controller.isLoading.value
            ? null
            : () {
                controller.loginUser();
              },
        style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF7EC1EB),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        child: controller.isLoading.value
            ? CircularProgressIndicator(
                color: Colors.white,
              )
            : Text(
                "Sign In",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              )));
  }
}
