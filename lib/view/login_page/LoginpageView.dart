import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih/widget/Login/Login_Icon.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(28),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: LogoProduct()),

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
                  style: TextStyle(),
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
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Color(0xFF8A8A8A),
                    ),
                  ),
                ),
              ),

              // SizedBox(
              //   height: 10,
              // ),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forget Password?",
                      style: GoogleFonts.poppins(
                        color: Color(0xFF7EC1EB),
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    )),
              ),

              SizedBox(
                height: 20,
              ),

              Center(
                child: SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF7EC1EB),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: Text(
                        "Sign In",
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
                          "Sign In with Google",
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                        Container(),
                      ],
                    ),
                  )),

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
                      onPressed: () {},
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
