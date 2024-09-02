import 'package:get/get.dart';

class OrderDetailcontroller extends GetxController {
  late final arguments;
  final isLoading = false.obs;
  final orders = {}.obs;

  String formatDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    String formattedDate =
        "${dateTime.day}/${dateTime.month}/${dateTime.year}";
    return formattedDate;
  }

  @override
  void onInit() {
    arguments = Get.arguments;
    orders.value = arguments['orderList'];
    super.onInit();
  }
}
