import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/data_pelanggan_reg/data_pelanggan_controller_reg.dart';

class DropdownKecamatanDeep extends GetView<DataPelangganRegController> {
  const DropdownKecamatanDeep({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return DropdownButtonFormField<int>(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 15),
        ),
        hint: Text('Pilih Kecamatan'),
        value: controller.kecamatanName.value.isEmpty
            ? null
            : int.tryParse(controller.kecamatanName.value),
        items: controller.kecamatan.map((kec) {
          return DropdownMenuItem<int>(
            value: kec['id'],
            child: Text(kec['kecamatan']),
          );
        }).toList(),
        onChanged: (int? newValue) {
          if (newValue != null) {
            controller.kecamatanName.value = newValue.toString();
          }
        },
      );
    });
  }
}
