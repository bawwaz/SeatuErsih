import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

class animationCheckout extends StatelessWidget {
  animationCheckout({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset('assets/img/success.json'),
      ),
    );
  }
}
