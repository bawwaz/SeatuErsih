import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Text(
          "Forget Password?",
          style: GoogleFonts.poppins(
            color: Color(0xFF7EC1EB),
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ));
  }
}
