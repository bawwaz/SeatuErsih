import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(children: [
            Padding(
              padding: const EdgeInsets.only(top: 70.0, left: 23),
              child: Container(
                height: 143,
                width: 143,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x26000000),
                        blurRadius: 2,
                        offset: Offset(0, 0),
                        spreadRadius: 1,
                      ),
                    ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 55.5, top: 85.0),
              child: Image(image: AssetImage('assets/img/Group 120.png')),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 170.0, left: 30.0),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align text to the left
                children: [
                  Text(
                    'Regular Clean',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '25K',
                    style: GoogleFonts.poppins(
                      color: Color(0xff6C6C6C),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ]),
          Stack(children: [
            Padding(
              padding: const EdgeInsets.only(top: 70.0, left: 23),
              child: Container(
                height: 143,
                width: 143,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x26000000),
                        blurRadius: 2,
                        offset: Offset(0, 0),
                        spreadRadius: 1,
                      ),
                    ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 65.5, top: 94.0),
              child: Image(image: AssetImage('assets/img/cleaning.png')),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 170.0, left: 30.0),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align text to the left
                children: [
                  Text(
                    'Deep Clean',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '25K',
                    style: GoogleFonts.poppins(
                      color: Color(0xff6C6C6C),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ]),
        ],
      ),
    );
  }
}
