import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/data_pelanggan_deep/data_pelanggan_controller_deep.dart';
import 'package:seatu_ersih/app/pages/features/data_pelanggan_reg/widget/textfieldata.dart';
import 'package:seatu_ersih/app/router/app_pages.dart';
import 'package:seatu_ersih/themes/colors.dart';
import 'package:seatu_ersih/themes/fonts.dart';

class DataPelangganDeepView extends GetView<DataPelangganControllerDeep> {
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
            _buildSectionHeader('Alamat', 'Alamat lokasi pengambilan sepatu'),
            TextFieldData(
              hintText: 'Masukkan alamat',
              onChanged: (value) {
                controller.address.value = value;
              },
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
                      textAlign: TextAlign.center,
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
              padding: const EdgeInsets.only(top: 150.0),
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
                      Get.offNamed(Routes.DEEP_CLEAN_LIST,
                          arguments: [controller.orders['id'].toString()]);
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
