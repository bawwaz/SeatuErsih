import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
              padding: const EdgeInsets.only(),
              child: Container(
                height: 143,
                width: MediaQuery.sizeOf(context).width * 0.41,
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
              padding: EdgeInsets.only(top: 20.0, left: 30),
              child: Image(image: AssetImage('assets/img/Group 120.png')),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100.0, left: 10),
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
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Stack(children: [
              Padding(
                padding: const EdgeInsets.only(),
                child: Container(
                  height: 143,
                  width: MediaQuery.sizeOf(context).width * 0.41,
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
                padding: EdgeInsets.only(top: 25.0, left: 40),
                child: Image(image: AssetImage('assets/img/cleaning.png')),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 100.0,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
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
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
