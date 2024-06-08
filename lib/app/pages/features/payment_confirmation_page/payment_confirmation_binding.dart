import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/payment_confirmation_page/payment_confirmation_controller.dart';

class PaymentConfirmationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentConfirmationController>(() => PaymentConfirmationController());
  }
}
