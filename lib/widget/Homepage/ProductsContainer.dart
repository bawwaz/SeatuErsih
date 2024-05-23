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
          Container(
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
            child: Column(
              children: [
                Image.asset('assets/img/Group 120.png'),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Regular Clean',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
                Text(
                  '25K',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff6C6C6C),
                      fontSize: 10),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
