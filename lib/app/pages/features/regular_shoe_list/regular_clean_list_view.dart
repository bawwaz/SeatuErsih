import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/regular_shoe_list/widget/reg_clean_list_container.dart';
import 'package:seatu_ersih/app/router/app_pages.dart';
import 'package:seatu_ersih/themes/colors.dart';
import 'package:seatu_ersih/themes/fonts.dart';

class RegCleanListView extends StatelessWidget {
  const RegCleanListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: InkWell(
            onTap: () {
              Get.toNamed(Routes.DATA_PELANGGAN_REG);
            },
            child: Image.asset('assets/img/angle-circle-right 1.png')),
        centerTitle: true,
        title: Text(
          'Regular Clean',
          style: Fonts.header1.copyWith(color: Colors.black),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Add your actual form content or widgets here
                    // Example form fields, replace with your actual widgets

                    SizedBox(height: 80), // Add some space at the bottom
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 67.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                        width: double.infinity,
                        height: 55,
                        decoration: BoxDecoration(
                          color: AppColors.lightGrey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Tambah Sepatu',
                            style: Fonts.slogan
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                        )),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                        width: double.infinity,
                        height: 55,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Checkout - ',
                            style: Fonts.slogan
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                        )),
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
