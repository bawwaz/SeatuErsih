import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih/app/pages/features/add_ons_page/add_ons_controller.dart';

class FloatingButtonTambahSepatu extends GetView<AddOnsController> {
  const FloatingButtonTambahSepatu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: FloatingActionButton.extended(
        onPressed: () async {
          controller.calculateTotal();
          await controller.postShoes();
          Get.back(result: "success");
        },
        backgroundColor: Color(0xFF7EC1EB),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        label: Text(
          'Tambah Sepatu',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
