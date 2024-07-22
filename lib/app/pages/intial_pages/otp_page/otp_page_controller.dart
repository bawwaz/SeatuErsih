import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpPageController extends GetxController {
   var focusNodes = List.generate(4, (_) => FocusNode()).obs;
  var controllers = List.generate(4, (_) => TextEditingController()).obs;
  var isFocused = List.generate(4, (_) => false.obs);

  @override
  void onClose() {
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    for (var controller in controllers) {
      controller.dispose();
    }
    super.onClose();
  }

  void updateFocus(int index, bool value) {
    isFocused[index].value = value;
  }
}
