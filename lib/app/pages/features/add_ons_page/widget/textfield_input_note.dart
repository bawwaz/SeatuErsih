import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/add_ons_page/add_ons_controller.dart';

class InputCatatan extends GetView<AddOnsController> {
  const InputCatatan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 5,
      onChanged: (value) {
        controller.shoesNote.value = value;
      },
      decoration: InputDecoration(
        hintText: 'Berikan arahan untuk membersihkan sepatu',
        border: InputBorder.none,
        contentPadding: EdgeInsets.all(20),
      ),
    );
  }
}