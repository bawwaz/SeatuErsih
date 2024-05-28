import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Address extends StatelessWidget {
  const Address({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 31, left: 27),
      child: InkWell(
        onTap: () {
          print('tes123');
        },
        child: Container(
          width: 210,
          height: 33,
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 0.5,
                blurRadius: 2,
              ),
            ],
          ),
          child: Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 10.0),
                child: Icon(
                  Icons.info,
                  color: Color(0xFF7EC1EB),
                  size: 20,
                ),
              ),
              SizedBox(width: 12),
              Text(
                "Alamat",
                style: GoogleFonts.poppins(
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}