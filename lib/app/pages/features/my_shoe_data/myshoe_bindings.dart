import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/my_shoe_data/myshoe_contoller.dart';

class MyShoesBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyShoeController>(() => MyShoeController());
  }
}
