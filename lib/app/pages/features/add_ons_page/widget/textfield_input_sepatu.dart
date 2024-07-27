import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih/app/pages/features/add_ons_page/add_ons_controller.dart';

class InputNamaSepatu extends GetView<AddOnsController> {
  const InputNamaSepatu({
    super.key,
  });

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
        () => controller.isOtherSelected.value
            ? TextField(
                onChanged: (value) {
                  controller.shoesName.value = value;
                  controller.checkShoesName();
                },
                decoration: InputDecoration(
                  hintText: 'Masukkan Nama Sepatu',
                  hintStyle: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                  border: InputBorder.none,
                ),
              )
            : DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  hint: Text(
                    'Pilih Nama Sepatu',
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  value: controller.shoesName.value.isEmpty
                      ? null
                      : controller.shoesName.value,
                  items: [
                    DropdownMenuItem(
                      value: 'Nike Air Force 1',
                      child: Text('Nike Air Force 1',
                          style: GoogleFonts.poppins(fontSize: 16)),
                    ),
                    DropdownMenuItem(
                      value: 'Adidas Samba',
                      child: Text('Adidas Samba',
                          style: GoogleFonts.poppins(fontSize: 16)),
                    ),
                    DropdownMenuItem(
                      value: 'Converse 70',
                      child: Text('Converse 70',
                          style: GoogleFonts.poppins(fontSize: 16)),
                    ),
                    DropdownMenuItem(
                      value: 'Other',
                      child: Text('Other',
                          style: GoogleFonts.poppins(fontSize: 16)),
                    ),
                  ],
                  onChanged: (value) {
                    if (value == 'Other') {
                      controller.isOtherSelected.value = true;
                      controller.shoesName.value = '';
                    } else {
                      controller.isOtherSelected.value = false;
                      controller.shoesName.value = value ?? '';
                    }
                  },
                  icon: Icon(Icons.arrow_drop_down, color: Colors.grey),
                ),
              ),
      ),
    );
  }
}
