import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih/app/pages/features/add_ons_page/add_ons_controller.dart';

class ButtonTambahSepatu extends GetView<AddOnsController> {
  const ButtonTambahSepatu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        controller.calculateTotal();
        await controller.postShoes();
        Get.back(result: "success");
      },
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFF7EC1EB),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            'Tambah Sepatu',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}