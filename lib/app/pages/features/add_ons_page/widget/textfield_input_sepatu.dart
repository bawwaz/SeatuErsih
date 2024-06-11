import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/add_ons_page/add_ons_controller.dart';


class InputNamaSepatu extends GetView<AddOnsController> {
  const InputNamaSepatu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        controller.shoesName.value = value;
      },
      decoration: InputDecoration(
        hintText: 'Masukkan nama sepatu',
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        contentPadding:
            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      ),
    );
  }
}