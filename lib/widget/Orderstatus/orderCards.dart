import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112,
      width: 306,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.5),
                offset: Offset(0, 0),
                blurRadius: 1.5,
                spreadRadius: 0.5),
          ]),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 19.0, bottom: 10),
            child: Container(
              height: 76,
              width: 76,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: Offset(0, 0),
                        blurRadius: 1.5,
                        spreadRadius: 0.5),
                  ]),
              child: Image.asset(
                'assets/img/Group 120.png',
              ),
            ),
          ),
          SizedBox(
            width: 14,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 9.5),
            child: Column(
              children: [
                Text(
                  'Regular Clean',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 16),
                ),
                Text('x2'
                ,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
