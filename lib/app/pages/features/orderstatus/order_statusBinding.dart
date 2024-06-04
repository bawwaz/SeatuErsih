import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/orderstatus/order_statusController.dart';

class orderStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => orderStatusController());
  }
}
