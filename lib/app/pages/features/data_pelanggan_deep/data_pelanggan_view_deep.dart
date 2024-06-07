import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/data_pelanggan_reg/widget/textfieldata.dart';
import 'package:seatu_ersih/app/router/app_pages.dart';
import 'package:seatu_ersih/themes/colors.dart';
import 'package:seatu_ersih/themes/fonts.dart';

class DataPelangganDeepView extends StatelessWidget {
  const DataPelangganDeepView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Data Pelanggan',
          style: Fonts.header1.copyWith(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        leading: InkWell(
          onTap: () {
            Get.toNamed(Routes.CHOOSE_SERVICE);
          },
          child: Image.asset('assets/img/angle-circle-right 1.png'),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Alamat',
                style: Fonts.header1.copyWith(color: Colors.black),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Alamat lokasi pengambilan sepatu',
                style: Fonts.detail,
              ),
            ),
            SizedBox(height: 7),
            TextFieldData(),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Contact',
                  style: Fonts.header1.copyWith(color: Colors.black),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'No. Telephone',
                style: Fonts.detail,
              ),
            ),
            SizedBox(height: 7),
            TextFieldData(),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Jadwal',
                  style: Fonts.header1.copyWith(color: Colors.black),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Tanggal pengambilan',
                style: Fonts.detail,
              ),
            ),
            SizedBox(height: 7),
            Stack(
              children: [
                TextFieldData(),
                Positioned(
                  left: 10,
                  top: 15,
                  child: InkWell(
                    onTap: () {},
                    child: Icon(Icons.calendar_month),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Note',
                  style: Fonts.header1.copyWith(color: Colors.black),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Berikan pesan tentang alamat mu',
                style: Fonts.detail,
              ),
            ),
            SizedBox(height: 7),
            TextFieldData(),
            Padding(
              padding: const EdgeInsets.only(top: 150.0),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.DEEP_CLEAN_LIST);
                },
                child: Container(
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Next',
                      style: Fonts.header1
                          .copyWith(fontWeight: FontWeight.w100, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
