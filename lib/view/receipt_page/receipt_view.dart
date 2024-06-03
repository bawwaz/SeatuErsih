import 'package:flutter/material.dart';
import 'package:get/get.dart';

class receipt extends StatelessWidget {
  const receipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Image.asset('assets/img/angle-circle-right 1.png')),
      ),
    );
  }
}
