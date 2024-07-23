import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:seatu_ersih/app/pages/intial_pages/otp_page/otp_page_controller.dart';

class OtpTextfields extends StatelessWidget {
  final OtpPageController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(6, (index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey),
          ),
          child: SizedBox(
            height: 45,
            width: MediaQuery.of(context).size.width / 7,
            child: TextField(
              controller: controller.controllers[index],
              focusNode: controller.focusNodes[index],
              onChanged: (value) {
                if (value.length == 1 && index < 5) {
                  FocusScope.of(context).nextFocus();
                } else if (value.isEmpty && index > 0) {
                  FocusScope.of(context).previousFocus();
                }
              },
              style: Theme.of(context).textTheme.headlineLarge,
              decoration: InputDecoration(
                border: InputBorder.none, // Remove default border
                enabledBorder: InputBorder.none, // Remove enabled border
                focusedBorder: InputBorder.none, // Remove focused border
              ),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
        );
      }),
    );
  }
}
