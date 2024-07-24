import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/intial_pages/register_page/registerController.dart';

class InputPasswordRegist extends StatelessWidget {
  final Function(String)? onChanged;
  const InputPasswordRegist({Key? key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RegisterPageController controller = Get.find();

    return Obx(() {
      return TextField(
        onChanged: onChanged,
        obscureText: controller.isPasswordHidden.value,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          labelText: "Password",
          prefixIcon: Icon(
            Icons.lock,
            color: Color(0xFF8A8A8A),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              controller.isPasswordHidden.value
                  ? Icons.visibility_off
                  : Icons.visibility,
            ),
            onPressed: () {
              controller.isPasswordHidden.value =
                  !controller.isPasswordHidden.value;
            },
          ),
        ),
      );
    });
  }
}
