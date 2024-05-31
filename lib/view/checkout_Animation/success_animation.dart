import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

class animationcheckout extends StatelessWidget {
  const animationcheckout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Lottie.asset('assets/img/success.json')
        ],
      ),
    );
  }
}