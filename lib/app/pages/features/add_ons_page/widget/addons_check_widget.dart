import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/add_ons_page/add_ons_controller.dart';
import 'package:seatu_ersih/themes/colors.dart';

class AddOnsCheckWidget extends GetView<AddOnsController> {
  final int index;
  const AddOnsCheckWidget({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black),
      ),
      width: 24,
      height: 24,
      child: Obx(() => Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: controller.isSelected![index]!.value
                    ? AppColors.primaryColor
                    : Colors.white),
          )),
    );
  }
}
