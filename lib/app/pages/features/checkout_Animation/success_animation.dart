import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:seatu_ersih/app/pages/features/checkout_Animation/animation_Controller.dart';

class AnimationCheckoutView extends GetView<CheckoutAnimationController> {
  AnimationCheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() => Center(
            child: Lottie.asset(controller.text.value),
          )),
    );
  }
}
