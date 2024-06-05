import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih/app/pages/features/add_address_page/add_address_controller.dart';

class TextFieldAddNumber extends StatelessWidget {
  final AddAddressController addAddressController =
      Get.put(AddAddressController());

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: addAddressController.phoneController,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        hintText: "+62 8XX XXXX XXXX",
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
