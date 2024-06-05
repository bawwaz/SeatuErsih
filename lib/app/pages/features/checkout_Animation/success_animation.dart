import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:seatu_ersih/app/pages/features/checkout_Animation/animation_Controller.dart';
import 'package:get/get.dart';

class animationCheckout extends StatelessWidget {
  animationCheckout({super.key});

  // Initialize the controller
  final checkoutAnimationController _navigationController =
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
