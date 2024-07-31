import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih/app/pages/features/data_pelanggan_reg/data_pelanggan_controller_reg.dart';

class DropdownKabupatenReg extends GetView<DataPelangganRegController> {
  const DropdownKabupatenReg({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 3,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Obx(
        () => DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            hint: Text(
              'Kabupaten',
              style: GoogleFonts.poppins(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
            value: controller.kabupatenName.value.isEmpty
                ? null
                : controller.kabupatenName.value,
            items: controller.kabupaten.map((kab) {
              return DropdownMenuItem<String>(
                value: kab['name'],
                child: Text(
                  kab['name'],
                  style: GoogleFonts.poppins(fontSize: 16),
                ),
              );
            }).toList(),
            onChanged: (value) {
              controller.kabupatenName.value = value ?? '';
            },
            icon: Icon(Icons.arrow_drop_down, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
