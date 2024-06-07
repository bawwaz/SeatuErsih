import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/regular_shoe_list/widget/reg_clean_list_container.dart';
import 'package:seatu_ersih/app/router/app_pages.dart';
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // RegCleanListContainer(shoename: shoename, add_ons: add_ons, note: note, total_harga: total_harga, logo: logo)
          ],
        ),
      ),
    );
  }
}
