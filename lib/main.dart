import 'package:flutter/material.dart';
import 'package:seatu_ersih/view/HomepageView.dart';
import 'package:seatu_ersih/view/login_page/LoginpageView.dart';
import 'package:seatu_ersih/view/register_page/RegisterviewPage.dart';
import 'package:seatu_ersih/view/splash_screen/splash_screen_view.dart';
import 'widget/Homepage/HomepageBar.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}
