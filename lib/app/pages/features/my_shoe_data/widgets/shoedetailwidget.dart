import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih/app/router/app_pages.dart';

class ShoeDetailWidget extends StatelessWidget {
  final String shoeName;
  final String addOns;
  final String notes;

  const ShoeDetailWidget({
    super.key,
    required this.shoeName,
    required this.addOns,
    required this.notes,
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
          Text(
            'Brand: $shoeName',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Add-ons: $addOns',
            style: GoogleFonts.poppins(fontSize: 16),
          ),
          SizedBox(height: 8),
          Text(
            'Shoe Note: $notes',
            style: GoogleFonts.poppins(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
