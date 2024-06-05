import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih/themes/colors.dart';
import 'package:seatu_ersih/themes/fonts.dart';
import 'package:seatu_ersih/app/pages/features/checkout_Order/widget/order_detail.dart';

class receipt extends StatelessWidget {
  const receipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Container(
        height: 400,
        width: 265,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10), // Border radius
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Shadow color
              spreadRadius: 1.2, // Spread radius
              blurRadius: 1, // Blur radius
              offset: Offset(0, 1), // Shadow position
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Order Detail',
              style: Fonts.headerBlack,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 27.0, top: 20),
              child: Row(
                children: [
                  Icon(
                    Icons.info,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Information',
                    style: GoogleFonts.poppins(
                      color: AppColors.primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            OrderDetail(),
          ],
        ),
      ),
    );
  }
}
