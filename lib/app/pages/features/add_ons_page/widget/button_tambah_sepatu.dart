import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonTambahSepatu extends StatelessWidget {
  const ButtonTambahSepatu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF7EC1EB),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          'Tambah Sepatu',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}