import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/checkout_Animation/animation_Controller.dart';

class animationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<checkoutAnimationController>(() => checkoutAnimationController());
  }
}
