import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/rating_page/rating_controller.dart';

class RatingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RatingController>(() => RatingController());
  }
}
