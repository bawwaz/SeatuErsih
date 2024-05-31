import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih/themes/colors.dart';
import 'package:seatu_ersih/view/order_booking_regular/order_booking_regular_controller.dart';
import 'package:seatu_ersih/widget/OrderBookingDeep/add_ons.dart';

class TextfieldInputSepatu extends StatelessWidget {
  const TextfieldInputSepatu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 170,
          height: 35,
          child: Padding(
            padding: const EdgeInsets.only(left: 27),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 5, left: 5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 9,
        ),
        InkWell(
          onTap: () async {
            await Get.bottomSheet(Container(
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: AddOns(controller: OrderBookingRegularController()),
                ))).then((value) => null);
          },
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1.2,
                  blurRadius: 1,
                ),
              ],
            ),
            child: Icon(
              Icons.check,
              color: Colors.white,
              size: 18,
            ),
          ),
        ),
      ],
    );
  }
}
