import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih/app/global_component/navbar/navbar.dart';
import 'package:seatu_ersih/app/pages/intial_pages/login_page/LoginpageView.dart';
import 'package:seatu_ersih/app/router/app_pages.dart';

import 'package:seatu_ersih/themes/colors.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
      ),
    );
  }
}
