import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih/themes/colors.dart';

class Fonts {
  static TextStyle slogan = GoogleFonts.poppins(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static TextStyle header1 = GoogleFonts.poppins(
    fontSize: 22,
    fontWeight: FontWeight.w900,
    color: Colors.white,
  );

  static TextStyle header1blu = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );

  static TextStyle header2 = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w200,
    color: Colors.white,
  );

  static TextStyle headerBlack = GoogleFonts.poppins(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static TextStyle detailBold = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static TextStyle detail = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: Color(0xff6C6C6C),
  );

  static TextStyle desc = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );
  static TextStyle checkout = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static TextStyle onboarding = GoogleFonts.poppins(
    fontSize: 18,
  );
}
