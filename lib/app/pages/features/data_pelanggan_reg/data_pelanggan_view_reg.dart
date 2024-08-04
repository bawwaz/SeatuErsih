import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih/app/pages/features/data_pelanggan_reg/data_pelanggan_controller_reg.dart';
import 'package:seatu_ersih/app/pages/features/data_pelanggan_reg/widget/dropdown_kabupaten.dart';
import 'package:seatu_ersih/app/pages/features/data_pelanggan_reg/widget/dropdown_kecamatan.dart';
import 'package:seatu_ersih/app/pages/features/data_pelanggan_reg/widget/textfield_alamat_spesifik.dart';
import 'package:seatu_ersih/app/pages/features/data_pelanggan_reg/widget/textfieldata.dart';
import 'package:seatu_ersih/app/router/app_pages.dart';
import 'package:seatu_ersih/themes/colors.dart';
import 'package:seatu_ersih/themes/fonts.dart';

class DataPelangganRegView extends GetView<DataPelangganRegController> {
  const DataPelangganRegView({super.key});

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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Alamat',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontSize: 24,
              ),
            ),
            Text(
              'Alamat lokasi pengambilan sepatu',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w300,
                color: Colors.black,
                fontSize: 13,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 7),
              child: Container(
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
                child: DropdownKabupatenReg(), // No need to pass kabupaten here
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 11),
              child: Container(
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
                child: DropdownKecamatanReg(),
              ),
            ),
            SizedBox(height: 11),
            Container(
              width: double.infinity,
              height: 70,
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
              child: TextfieldAlamatSpesifik(
                controller: controller,
                onChanged: (value) {
                  controller.specificAddress.value = value;
                },
              ),
            ),
            SizedBox(height: 20),
            _buildSectionHeader('Contact', 'No. Telephone'),
            TextFieldData(
              hintText: 'Masukkan no. telephone',
              onChanged: (value) {
                controller.phone.value = value;
              },
            ),
            SizedBox(height: 20),
            _buildSectionHeader('Jadwal', 'Tanggal pengambilan'),
            Stack(
              children: [
                Obx(() => TextFieldData(
                      hintText: 'Masukkan tanggal pengambilan',
                      initialValue: controller.pickup_date.value,
                      readOnly: true,
                      textAlign: TextAlign.start,
                      padding: EdgeInsets.only(left: 50),
                    )),
                Positioned(
                  left: 10,
                  top: 15,
                  child: InkWell(
                    onTap: () {
                      controller.pickDate(context);
                    },
                    child: Icon(Icons.calendar_month),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            _buildSectionHeader('Note', 'Berikan pesan tentang alamat mu'),
            TextFieldData(
              hintText: 'Masukkan pesan',
              onChanged: (value) {
                controller.notes.value = value;
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Container(
                width: double.infinity,
                height: 55,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  onTap: () async {
                    bool success = await controller.postOrders();
                    if (success) {
                      Get.offNamed(Routes.REG_CLEAN_LIST, arguments: [
                        controller.orders['id'].toString(),
                        controller.orders['laundry_id'].toString(),
                      ]);
                    } else {
                      Get.snackbar('Error', 'Failed to submit data');
                    }
                  },
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

  Widget _buildSectionHeader(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: Fonts.header1.copyWith(color: Colors.black),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            subtitle,
            style: Fonts.detail,
          ),
        ),
        SizedBox(height: 7),
      ],
    );
  }
}
