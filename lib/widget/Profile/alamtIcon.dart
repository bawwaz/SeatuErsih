import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class saved extends StatelessWidget {
  const saved({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.bookmark,
          color: Color(0xffFBFF89),
        ),
        SizedBox(
          width: 27,
        ),
        Text(
          'Alamat tersimpan',
          style: GoogleFonts.poppins(
              color: Color(0xff000000), fontWeight: FontWeight.w500),
        ),
        SizedBox(
          width: 79,
        ),
        Icon(Icons.keyboard_arrow_right_rounded),
      ],
    );
  }
}
