import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih/view/register_page/register_page.controller.dart';

class Registerpage extends StatelessWidget {
  const Registerpage({Key? key}) : super(key: key);

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
              Padding(
                padding: const EdgeInsets.only(top: 58, left: 145),
                child: Image.asset("assets/img/icon-app.png"),
              ),

              SizedBox(
                height: 29,
              ),

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

              SizedBox(
                height: 20,
              ),

              SizedBox(
                width: double.infinity,
                height: 53,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelText: "Name",
                    prefixIcon: Icon(
                      Icons.person,
                      color: Color(0xFF8A8A8A), // atur warna ikon
                    ),
                    labelStyle: TextStyle(
                      // color: Color(0xFF8A8A8A), // atur warna teks
                    ),
                  ),
                  style: TextStyle(
                  ),
                ),
              ),


              SizedBox(
                height: 20,
              ),

              SizedBox(
                width: double.infinity,
                height: 53,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelText: "Email",
                    prefixIcon: Icon(
                      Icons.email,
                      color: Color(0xFF8A8A8A), // atur warna ikon
                    ),
                    labelStyle: TextStyle(
                      // color: Color(0xFF8A8A8A), // atur warna teks
                    ),
                  ),
                  style: TextStyle(
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),

              SizedBox(
                width: double.infinity,
                height: 53,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelText: "Password",
                    prefixIcon: Icon(Icons.lock,
                      color: Color(0xFF8A8A8A),),
                  ),
                ),
              ),

              SizedBox(
                height: 17,
              ),

              Row(
                children: [
                  Obx(() => GestureDetector(
                    onTap: () => controller.checked.value = !controller.checked.value,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Color(0xFFC1C1C1)),
                          borderRadius: BorderRadius.circular(5),
                        color: controller.checked.value ? Color(0xFF7EC1EB) : Colors.transparent
                      ),
                      child: controller.checked.value ? Icon(Icons.check, size: 18, color: Colors.white,) : SizedBox(height: 20, width: 20,),
                    ),
                  )),
                  Container(
                    width: 300,
                    margin: EdgeInsets.only(left: 8),
                    child: Text("I agree with SEATUERSIH Terms of Service, Privacy Policy. and default Notification Settings.",
                      style: GoogleFonts.poppins(
                        color: Color(0xFF1F1F1F),
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                      ),),
                  ),
                ],
              ),

              SizedBox(
                height: 49,
              ),

              Center(
                child: SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                      onPressed: () {
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF7EC1EB),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: Text(
                        "Create account",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
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
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFFFFFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 5, // Menentukan elevasi bayangan
                      shadowColor: Colors.black, // Menentukan warna bayangan

                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset("assets/img/google-icon.png"),
                        Text(
                          "Sign Up with Google",
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        Container(),
                      ],
                    ),
                  )
              ),

              SizedBox(
                height: 20,
              ),

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

                  TextButton(onPressed: () {},
                      child: Text("Sign In",
                        style: GoogleFonts.poppins(
                          color: Color(0xFF7EC1EB),
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                        ),)),
                ],
              ),



            ],
          ),
        ),
      ),
    );
  }
}
