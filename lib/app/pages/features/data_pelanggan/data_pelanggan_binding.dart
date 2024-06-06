import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/data_pelanggan/data_pelanggan_controller.dart';

class DataPelangganBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DataPelangganController>(() => DataPelangganController());
  }
}
