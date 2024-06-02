import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih/themes/colors.dart';
import 'package:seatu_ersih/themes/fonts.dart';
import 'package:seatu_ersih/widget/order_detail.dart/order_detailAsset.dart';
import 'package:seatu_ersih/widget/order_detail.dart/order_detailTextDesc.dart';

class DetailBody extends StatelessWidget {
  const DetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(height: 10),
            Container(
              height: 163,
              width: 163,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xff000000),
                        blurRadius: 0.5,
                        offset: Offset(0, 0))
                  ]),
              child: Center(
                child: Image.asset(
                  'assets/img/Group 120.png',
                ),
              ),
            ),
            SizedBox(
              height: 28,
            ),
            Desc(),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 61.0),
              child: assetOrderDetail(),
            ),
          ],
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
            child: Container(
              color: AppColors.primaryColor,
              height: 60, // Adjust the height if needed
              alignment: Alignment.center,
              child: Text(
                'Order Detail',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 70, // Adjust this value as needed
          child: Center(
            child: Container(
              height: 50, // Adjust as needed
              width: 50, // Adjust as needed
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                Icons.arrow_upward,
                size: 30.0,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
