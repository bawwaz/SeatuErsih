import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/data_pelanggan_deep/data_pelanggan_controller_deep.dart';

class DropdownKabupatenDeep extends GetView<DataPelangganControllerDeep> {
  const DropdownKabupatenDeep({super.key});

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
        hint: Text('Pilih Kabupaten'),
        value: controller.kabupatenName.value.isEmpty
            ? null
            : int.tryParse(controller.kabupatenName.value),
        items: controller.kabupaten.map((kab) {
          return DropdownMenuItem<int>(
            value: kab['id'],
            child: Text(kab['kabupaten']),
          );
        }).toList(),
        onChanged: (int? newValue) {
          if (newValue != null) {
            controller.kabupatenName.value = newValue.toString();
            controller.kecamatanName.value = ''; // Reset kecamatan value
            controller.fetchKecamatanByKabupatenId(newValue);
          }
        },
      );
    });
  }
}