import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/Home_Page/HomepageView.dart';
import 'package:seatu_ersih/app/router/app_pages.dart';

class checkoutAnimationController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 1), () {
      Get.toNamed(Routes.BTMNAVBAR);
    });
  }
}
