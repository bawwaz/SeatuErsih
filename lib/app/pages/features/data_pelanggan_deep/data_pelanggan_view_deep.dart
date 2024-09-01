import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih/app/pages/features/data_pelanggan_deep/data_pelanggan_controller_deep.dart';
import 'package:seatu_ersih/app/pages/features/data_pelanggan_deep/widget/dropdown_kabupaten.dart';
import 'package:seatu_ersih/app/pages/features/data_pelanggan_deep/widget/dropdown_kecamatan.dart';
import 'package:seatu_ersih/app/pages/features/data_pelanggan_reg/widget/textfield_alamat_spesifik.dart';
import 'package:seatu_ersih/app/pages/features/data_pelanggan_reg/widget/textfieldata.dart';
import 'package:seatu_ersih/app/router/app_pages.dart';
import 'package:seatu_ersih/themes/colors.dart';
import 'package:seatu_ersih/themes/fonts.dart';

class DataPelangganDeepView extends StatelessWidget {
  DataPelangganDeepView({super.key});

  // Inject the controller
  final DataPelangganControllerDeep controller =
      Get.put(DataPelangganControllerDeep());

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
            _confirmCancelDialog(context);
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
                child: DropdownKabupatenDeep(),
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
                child: DropdownKecamatanDeep(),
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
                onChanged: (value) {
                  controller.detail_address.value = value;
                },
              ),
            ),
            SizedBox(height: 20),
            _buildSectionHeader('Contact', 'No. Telephone'),
            TextFieldData(
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                      Get.offNamed(Routes.DEEP_CLEAN_LIST, arguments: [
                        controller.orders['id'],
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

  Future<bool> _confirmCancelDialog(BuildContext context) async {
    return (await showDialog<bool>(
          context: context,
          barrierDismissible: false, // User must tap a button
          builder: (context) => AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: Row(
              children: [
                Icon(
                  Icons.cancel,
                  color: AppColors.primaryColor,
                ),
                SizedBox(width: 10),
                Text(
                  'Cancel Order?',
                  style: Fonts.header1.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            content: Text(
              'Do you want to cancel this order?',
              style: Fonts.detail.copyWith(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(
                  'No',
                  style: Fonts.header1.copyWith(color: AppColors.primaryColor),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true); // Close the dialog
                  Get.toNamed(
                      Routes.CHOOSE_SERVICE); // Navigate to the desired route
                },
                child: Text(
                  'Yes',
                  style: Fonts.header1.copyWith(color: AppColors.primaryColor),
                ),
              ),
            ],
          ),
        )) ??
        false; // Return false if the dialog is dismissed
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
