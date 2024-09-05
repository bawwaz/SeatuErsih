import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart'; // Import this for date formatting
import 'package:seatu_ersih/app/router/app_pages.dart';

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
    String statusToShow = productStatus == 'waiting_for_payment'
        ? 'To be paid'
        : productStatus ?? '';

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
          if (id != null) ...[
            Text(
              'Order ID: $id',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: Colors.black.withOpacity(0.5)),
            ),
            Divider(color: Colors.grey),
          ],
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
                if (statusToShow
                    .isNotEmpty) // Check if statusToShow is not empty
                  Text(
                    statusToShow,
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
              'Pick Up: ${_formatDate(pickupDate!)}',
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
          ],
          if (price != null) ...[
            Text(
              'Price',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            GestureDetector(
              onTap: () {
                if (id != null) {
                  Get.toNamed(Routes.MYSHOES, arguments: {'id': id});
                }
              },
              child: Row(
                children: [
                  Text(
                    price!,
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, bottom: 2.5),
                    child: IconButton(
                      onPressed: () {
                        if (id != null) {
                          Get.toNamed(Routes.MYSHOES, arguments: {'id': id});
                        }
                      },
                      icon: Icon(
                        Icons.info,
                        size: 20,
                        color: Colors.lightBlue,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  // Function to format date
  String _formatDate(String date) {
    try {
      DateTime parsedDate = DateTime.parse(date);
      return DateFormat('d MMMM yyyy')
          .format(parsedDate); // Formats as 28 September 2024
    } catch (e) {
      return date; // Return the original date if parsing fails
    }
  }
}
