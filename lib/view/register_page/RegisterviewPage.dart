import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih/controller/registerController.dart';
import 'package:seatu_ersih/routes/routes.dart';
import 'package:seatu_ersih/view/register_page/register_page.controller.dart';
import 'package:seatu_ersih/widget/Register/register_create_account.dart';
import 'package:seatu_ersih/widget/Register/register_icon.dart';
import 'package:seatu_ersih/widget/Register/register_input_email.dart';
import 'package:seatu_ersih/widget/Register/register_input_number.dart';
import 'package:seatu_ersih/widget/Register/register_input_password.dart';
import 'package:seatu_ersih/widget/Register/register_input_username.dart';
import 'package:seatu_ersih/database/seatuersihRegister.dart';
import 'package:seatu_ersih/widget/Register/register_sign_up_google.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
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
                width: double.infinity,
                height: 53,
                child: Inputnumberregist(
                  onChanged: (value) => controller.phone.value = value,
                ),
              ),
              Row(
                children: [
                  Obx(() => GestureDetector(
                        onTap: () => controller.checked.value =
                            !controller.checked.value,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: Color(0xFFC1C1C1)),
                            borderRadius: BorderRadius.circular(5),
                            color: controller.checked.value
                                ? Color(0xFF7EC1EB)
                                : Colors.transparent,
                          ),
                          child: controller.checked.value
                              ? Icon(
                                  Icons.check,
                                  size: 18,
                                  color: Colors.white,
                                )
                              : SizedBox(
                                  height: 20,
                                  width: 20,
                                ),
                        ),
                      )),
                  Expanded(
                    child: Container(
                      width: 290,
                      margin: EdgeInsets.only(left: 8),
                      child: Text(
                        "I agree with SEATUERSIH Terms of Service, Privacy Policy. and default Notification Settings.",
                        style: GoogleFonts.poppins(
                          color: Color(0xFF1F1F1F),
                          fontWeight: FontWeight.w500,
                          fontSize: 9,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 49),
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
                      Get.toNamed(Routes.login);
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
