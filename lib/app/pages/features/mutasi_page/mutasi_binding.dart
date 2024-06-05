import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/mutasi_page/mutasi_controller.dart';

class MutasiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MutasiController>(() => MutasiController());
  }
}
