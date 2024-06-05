import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/mutasi_page/paymenthistoryController.dart';

class paymenthistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<paymenthistoryController>(() => paymenthistoryController());
  }
}
