import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih/app/pages/features/add_ons_page/widget/button_tambah_sepatu.dart';
import 'package:seatu_ersih/app/pages/features/add_ons_page/widget/list_view_addons.dart';
import 'package:seatu_ersih/app/pages/features/add_ons_page/widget/textfield_input_note.dart';
import 'package:seatu_ersih/app/pages/features/add_ons_page/widget/textfield_input_sepatu.dart';
import 'package:seatu_ersih/app/pages/features/add_ons_page/add_ons_controller.dart';

class AddOnsView extends StatelessWidget {
  const AddOnsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Image.asset('assets/img/angle-circle-right 1.png'),
        ),
        centerTitle: true,
        title: Text(
          'Tambah Sepatu',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tambah Nama Sepatu Anda',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 3,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: InputNamaSepatu(),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Ad-ons',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 7),
            Addons(),
            SizedBox(
              height: 5,
            ),
            Text(
              'Note',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: double.infinity,
              height: 90,
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 5,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: InputCatatan(),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {},
              child: ButtonTambahSepatu(),
            ),
          ],
        ),
      ),
    );
  }
}
