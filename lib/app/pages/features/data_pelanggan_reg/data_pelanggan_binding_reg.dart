import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/data_pelanggan_deep/data_pelanggan_controller_deep.dart';

class DataPelangganRegBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DataPelangganControllerDeep>(
        () => DataPelangganControllerDeep());
  }
}
