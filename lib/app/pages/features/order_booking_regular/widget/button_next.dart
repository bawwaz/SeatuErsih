import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:seatu_ersih/app/pages/features/checkout_Order/widget/ordernow.dart';
import 'package:seatu_ersih/app/pages/features/order_booking_regular/order_booking_regular_controller.dart';
import 'package:seatu_ersih/app/router/app_pages.dart';

class ButtonNext extends GetView<OrderBookingRegularController> {
  const ButtonNext({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Align(
        alignment: Alignment.centerRight,
        child: InkWell(
          onTap: () {
            Get.toNamed(Routes.CHECKOUT, arguments: [controller.shoes, controller.dates.value]);
          },
          child: Container(
            width: 68,
            height: 29,
            decoration: BoxDecoration(
              color: Color(0xFF7EC1EB),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Icon(
                Icons.east,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
