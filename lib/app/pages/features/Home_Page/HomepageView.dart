import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih/app/router/app_pages.dart';
import 'package:seatu_ersih/themes/colors.dart';
import 'package:seatu_ersih/app/pages/features/Home_Page/widget/HomepageBody.dart';
import 'package:seatu_ersih/app/pages/features/Home_Page/HomepageController.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomePageController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryColor,
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Image(image: AssetImage('assets/img/icon.png')),
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await homeController.fetchReviews1();
            await homeController.fetchReviews2();
          },
          child: HomeBody(),
        ),
      ),
    );
  }
}
