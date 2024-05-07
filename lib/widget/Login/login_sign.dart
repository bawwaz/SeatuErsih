import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
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
        ));
  }
}
