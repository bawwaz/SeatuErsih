import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih/app/router/app_pages.dart';
import 'package:seatu_ersih/themes/colors.dart';
import 'package:seatu_ersih/app/pages/features/Home_Page/widget/HomepageBody.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryColor,
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Image(image: AssetImage('assets/img/icon.png')),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: Stack(
              children: [
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.PROFILE);
                  },
                  child: Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xff545454),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14.0, left: 14),
                  child: Image(image: AssetImage('assets/img/user.png')),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: HomeBody(),
      ),
    );
  }
}
