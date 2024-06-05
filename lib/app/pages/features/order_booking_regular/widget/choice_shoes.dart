import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChoiceSepatu extends StatelessWidget {
  final String name;
  const ChoiceSepatu({
    required this.name,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Container(
            width: 95,
            height: 23,
            decoration: BoxDecoration(
              color: Color(0xFF838383),
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1.2,
                  blurRadius: 1,
                ),
              ],
            ),
            child: Center(
              child: Text(
                name,
                style: GoogleFonts.poppins(
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 7,
        ),
      ],
    );
  }
}
