import 'package:get/get.dart';

class OrderBookingRegularController extends GetxController {
  var checked = false.obs;

  get selectedIndex => null;

  final List<RxBool> checkedkotoll = List.generate(4, (index) => false.obs);
}
