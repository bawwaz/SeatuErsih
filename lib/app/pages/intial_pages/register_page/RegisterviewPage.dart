import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih/app/pages/intial_pages/register_page/registerController.dart';
import 'package:seatu_ersih/app/pages/intial_pages/register_page/widget/register_create_account.dart';
import 'package:seatu_ersih/app/pages/intial_pages/register_page/widget/register_icon.dart';
import 'package:seatu_ersih/app/pages/intial_pages/register_page/widget/register_input_email.dart';
import 'package:seatu_ersih/app/pages/intial_pages/register_page/widget/register_input_number.dart';
import 'package:seatu_ersih/app/pages/intial_pages/register_page/widget/register_input_password.dart';
import 'package:seatu_ersih/app/pages/intial_pages/register_page/widget/register_input_username.dart';
import 'package:seatu_ersih/app/api/database/seatuersihRegister.dart';
import 'package:seatu_ersih/app/pages/intial_pages/register_page/widget/register_sign_up_google.dart';
import 'package:seatu_ersih/app/router/app_pages.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterPageController());
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(28),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: LogoProductRegist()),
              SizedBox(height: 29),
              Row(
                children: [
                  Text(
                    "Register",
                    style: GoogleFonts.poppins(
                      color: Color(0xFF000000),
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 53,
                child: InputUsernameRegist(
                  onChanged: (value) => controller.username.value = value,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 53,
                child: InputEmailRegist(
                  onChanged: (value) => controller.email.value = value,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 53,
                child: InputPasswordRegist(
                  onChanged: (value) => controller.password.value = value,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 53,
                child: Inputnumberregist(
                  onChanged: (value) => controller.phone.value = value,
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: Obx(() => ElevatedButton(
                        onPressed: controller.isLoading.value
                            ? null
                            : () => controller.registerUser(),
                        child: controller.isLoading.value
                            ? CircularProgressIndicator()
                            : Text('Create Account'),
                      )),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      width: 99,
                      height: 1,
                      decoration: BoxDecoration(
                        color: Color(0xFF8A8A8A),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "or continue with",
                      style: GoogleFonts.poppins(
                        color: Color(0xFF8A8A8A),
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 99,
                      height: 1,
                      decoration: BoxDecoration(
                        color: Color(0xFF8A8A8A),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 33),
              SizedBox(
                width: double.infinity,
                height: 53,
                child: SignUpGoogle(),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: GoogleFonts.poppins(
                      color: Color(0xFF1F1F1F),
                      fontWeight: FontWeight.normal,
                      fontSize: 13,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.LOGIN);
                    },
                    child: Text(
                      "Sign In",
                      style: GoogleFonts.poppins(
                        color: Color(0xFF7EC1EB),
                        fontWeight: FontWeight.normal,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
