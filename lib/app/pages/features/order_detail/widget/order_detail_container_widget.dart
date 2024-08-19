import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailContainerWidget extends StatelessWidget {
  final String? productName;
  final String? productStatus;
  final String? pickupDate;
  final String? noteOrder;
  final String? price;
  final int? id;

  const DetailContainerWidget({
    super.key,
    this.productName,
    this.productStatus,
    this.pickupDate,
    this.noteOrder,
    this.price,
    this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 5,
            spreadRadius: 0,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (productName != null || productStatus != null) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (productName != null)
                  Text(
                    'Product',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                if (productStatus != null)
                  Text(
                    productStatus!,
                    style: GoogleFonts.poppins(
                      color: Colors.lightBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
              ],
            ),
            if (productName != null)
              Text(
                productName!,
                style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            Divider(color: Colors.grey),
          ],
          if (pickupDate != null) ...[
            Text(
              'Tanggal',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              'Pick Up: $pickupDate',
              style: GoogleFonts.poppins(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            Divider(color: Colors.grey),
          ],
          if (noteOrder != null) ...[
            Text(
              'Note',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              noteOrder!,
              style: GoogleFonts.poppins(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            Divider(color: Colors.grey),
            Text(
              'Price',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              price!,
              style: GoogleFonts.poppins(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
