import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih/app/pages/features/data_pelanggan_deep/data_pelanggan_controller_deep.dart';

class DropdownKabupatenDeep extends GetView<DataPelangganControllerDeep> {
  const DropdownKabupatenDeep({super.key});

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
            items: [
              DropdownMenuItem(
                value: 'Pati',
                child: Text('Pati', style: GoogleFonts.poppins(fontSize: 16)),
              ),
              DropdownMenuItem(
                value: 'Kudus',
                child: Text('Kudus', style: GoogleFonts.poppins(fontSize: 16)),
              ),
            ],
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
