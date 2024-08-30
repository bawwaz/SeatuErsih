import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/notification_page/notification_controller.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationController>(() => NotificationController());
  }
}
