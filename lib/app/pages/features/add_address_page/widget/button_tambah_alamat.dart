import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih/app/pages/features/add_address_page/add_address_controller.dart';

class ButtonTambahAlamat extends StatelessWidget {
  final AddAddressController addAddressController =
      Get.put(AddAddressController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        addAddressController.addAddress();
      },
      child: Container(
        width: 210,
        height: 30,
        decoration: BoxDecoration(
          color: Color(0xFF7EC1EB),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            "Tambah Alamat",
            style: GoogleFonts.poppins(
              color: Color(0xFFFFFFFF),
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
