import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInGoogle extends StatelessWidget {
  const SignInGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFFFFFFF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 5,
        shadowColor: Colors.black,
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
    );
  }
}
