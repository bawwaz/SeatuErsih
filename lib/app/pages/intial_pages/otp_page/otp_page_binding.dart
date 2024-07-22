import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/intial_pages/otp_page/otp_page_controller.dart';

class OtpPageBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<OtpPageController>(() => OtpPageController());
  }}