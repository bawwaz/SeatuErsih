import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih/app/pages/features/choose_service/widget/choose_service_container.dart';
import 'package:seatu_ersih/app/router/app_pages.dart';
import 'package:seatu_ersih/themes/fonts.dart';

class ChooseService extends StatelessWidget {
  const ChooseService({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Get.toNamed(Routes.BTMNAVBAR);
          },
          child: Image.asset('assets/img/angle-circle-right 1.png'),
        ),
        title: Text(
          'Pilih Jasa',
          style: Fonts.header1.copyWith(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text(
                    'Jasa yang kami sediakan',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ServiceContainer(
                onPressed: () {
                  Get.toNamed(Routes.DATA_PELANGGAN_REG);
                },
                title: 'Regular Clean',
                description:
                    'Proses pembersihan standar untuk sepatu yang meliputi bebxerapa langkah dasar untuk menghilangkan kotoran, noda, dan bau yang menempel pada sepatu.',
                price: '25K',
                buttonText: 'Order Now',
                icon: Icons.cleaning_services,
              ),
              SizedBox(height: 20),
              ServiceContainer(
                onPressed: () {
                  Get.toNamed(Routes.DATA_PELANGGAN_DEEP);
                },
                title: 'Deep Clean',
                description:
                    'Proses pembersihan standar untuk sepatu yang meliputi beberapa langkah dasar untuk menghilangkan kotoran, noda, dan bau yang menempel pada sepatu.',
                price: '35K',
                buttonText: 'Order Now',
                icon: Icons.cleaning_services,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
