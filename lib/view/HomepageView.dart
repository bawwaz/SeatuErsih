import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih/themes/colors.dart';
import 'package:seatu_ersih/widget/Homepage/HomepageBar.dart';
import 'package:seatu_ersih/widget/Homepage/HomepageBody.dart';
import 'package:seatu_ersih/routes/routes.dart';
import 'package:seatu_ersih/widget/Homepage/ProductsContainer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

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
                    Get.toNamed(Routes.profile);
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
                )
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [HomeBody(),],
      ),
    );
  }
}
