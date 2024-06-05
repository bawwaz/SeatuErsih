import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DateController extends GetxController{
final TextEditingController dateController = TextEditingController();

Future<void> selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null) {
      dateController.text = "${selectedDate.toLocal()}".split(' ')[0];
    }
  }
}