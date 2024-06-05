import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih/app/pages/features/add_address_page/add_address_controller.dart';

class TextFieldAddStreet extends StatelessWidget {
  final AddAddressController addAddressController =
      Get.put(AddAddressController());

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: addAddressController.streetController,
      decoration: InputDecoration(
        hintText: "Nama Jalan",
        hintStyle: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        contentPadding: EdgeInsets.only(bottom: 5, left: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}