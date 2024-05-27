import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih/controller/loginController.dart';


class SignIn extends StatelessWidget {
  final LoginPageController controller = Get.put(LoginPageController());

  SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        controller.login();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF7EC1EB),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Text(
        "Sign In",
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
