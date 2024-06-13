import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/checkout_Animation/animation_Controller.dart';

class AnimationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckoutAnimationController>(() => CheckoutAnimationController());
  }
}
