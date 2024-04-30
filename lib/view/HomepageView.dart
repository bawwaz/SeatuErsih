import 'package:flutter/material.dart';
import 'package:seatu_ersih/widget/Homepage/HomepageBar.dart';
import 'package:seatu_ersih/widget/Homepage/HomepageBody.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppbarHome(),
          HomeBody(),
        ],
      ),
    );
  }
}
