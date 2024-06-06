import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'animation_Controller.dart';

class animationCheckout extends StatelessWidget {
  animationCheckout({super.key});
  final checkoutAnimationController _controller =
      Get.put(checkoutAnimationController());

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
