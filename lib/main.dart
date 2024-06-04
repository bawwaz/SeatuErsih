import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih/routes/navbar.dart';
import 'package:seatu_ersih/view/login_page/LoginpageView.dart';
import 'routes/routes.dart';
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
      initialRoute: Routes.addadress,
      getPages: Routes.pages,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
      ),
    );
  }
}
