import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih/app/pages/intial_pages/login_page/loginController.dart';
import 'package:seatu_ersih/app/router/app_pages.dart';
import 'package:seatu_ersih/app/pages/intial_pages/login_page/widget/login_Icon.dart';
import 'package:seatu_ersih/app/pages/intial_pages/login_page/widget/login_forget_password.dart';
import 'package:seatu_ersih/app/pages/intial_pages/login_page/widget/auth_textfield.dart';
import 'package:seatu_ersih/app/pages/intial_pages/login_page/widget/login_sign.dart';
import 'package:seatu_ersih/app/pages/intial_pages/login_page/widget/login_sign_google.dart';
import 'package:seatu_ersih/themes/theme.dart';

class LoginPage extends GetView<LoginPageController> {
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailKey = GlobalKey<FormState>();
    final passwordKey = GlobalKey<FormState>();

    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(28),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: LogoProduct(),
              ),
              SizedBox(
                height: 29,
              ),
              Row(
                children: [
                  Text(
                    "Login ",
                    style: GoogleFonts.poppins(
                      color: Color(0xFF000000),
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                  Text(
                    "SEATUERSIH",
                    style: GoogleFonts.poppins(
                      color: Color(0xFF7EC1EB),
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              AuthTextField(
                formKey: emailKey,
                hintText: "Email",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email tidak boleh kosong';
                  } else if (GetUtils.isEmail(value) == false) {
                    return 'Email tidak valid';
                  }
                  controller.email.value = value;
                  return null;
                },
                prefixIcon: Icon(
                  Icons.email,
                  size: 25,
                  color: darkGrey,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              AuthTextField(
                formKey: passwordKey,
                hintText: "Password",
                obsecureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password tidak boleh kosong';
                  } else {
                    controller.password.value = value;
                  }
                  ;

                  return null;
                },
                prefixIcon: Icon(
                  Icons.lock,
                  size: 25,
                  color: darkGrey,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ForgetPassword(),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: SignIn(
                    onPressed: () {
                      if (emailKey.currentState!.validate() &&
                          passwordKey.currentState!.validate()) {
                        controller.login();
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
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
              SizedBox(
                height: 33,
              ),
              SizedBox(
                width: double.infinity,
                height: 53,
                child: SignInGoogle(),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t have an account?",
                    style: GoogleFonts.poppins(
                      color: Color(0xFF1F1F1F),
                      fontWeight: FontWeight.normal,
                      fontSize: 13,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.REGIS);
                      },
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.poppins(
                          color: Color(0xFF7EC1EB),
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
