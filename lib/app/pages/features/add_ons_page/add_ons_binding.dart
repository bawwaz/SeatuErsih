import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/add_ons_page/add_ons_controller.dart';

class AddOnsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AddOnsController>(() => AddOnsController());
  }

}