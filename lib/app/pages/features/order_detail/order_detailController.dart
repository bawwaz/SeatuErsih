import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OrderDetailcontroller extends GetxController {
  late final arguments;
  final isLoading = false.obs;
  final orders = {}.obs;

  String formatDate(String date) {
    try {
      DateTime dateTime = DateTime.parse(date);
      String formattedDate = DateFormat('d MMMM yyyy').format(dateTime);
      return formattedDate;
    } catch (e) {
      return date; // Return the original date if parsing fails
    }
  }

  @override
  void onInit() {
    arguments = Get.arguments;
    orders.value = arguments['orderList'];
    super.onInit();
  }
}
