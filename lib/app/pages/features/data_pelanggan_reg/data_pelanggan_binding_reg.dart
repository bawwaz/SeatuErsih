import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/data_pelanggan_reg/data_pelanggan_controller_reg.dart';

class DataPelangganRegBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DataPelangganRegController>(() => DataPelangganRegController());
  }
}
