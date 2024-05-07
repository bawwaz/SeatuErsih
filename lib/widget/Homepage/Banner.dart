import 'package:flutter/material.dart';

class banner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 333,
      height: 200.46,
      child: Stack(
        children: [
          Container(
            width: 306,
            height: 170,
            decoration: BoxDecoration(
              color: Color(0xFF23A0EF),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Color(0x33000000),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                  spreadRadius: 0.50,
                ),
              ],
            ),
            child: Stack(
              children: [
                Positioned(
                  right: 20,
                  top: 20,
                  child: Container(
                    width: 62,
                    height: 63,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Positioned(
                  right: 60,
                  top: 30,
                  child: Container(
                    width: 42,
                    height: 43,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(width: 0.10),
                    ),
                  ),
                ),
                Positioned(
                  right: 30,
                  top: 70,
                  child: Container(
                    width: 50.69,
                    height: 51.51,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                // Add more circular containers as needed
              ],
            ),
          ),
          Positioned(
            left: 25,
            top: 38,
            child: Text(
              'SPECIAL PROMO',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
          ),
          Positioned(
            left: 25,
            top: 71,
            child: SizedBox(
              width: 183,
              height: 42,
              child: Text(
                'Cuci 2 Gratis 1 !!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            right: 25,
            top: 0,
            child: Transform(
              transform: Matrix4.rotationZ(0.08),
              child: Container(
                width: 124.65,
                height: 169.05,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/img/shoe.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
