import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/data_pelanggan_reg/data_pelanggan_controller_reg.dart';

class DropdownKabupatenReg extends StatelessWidget {
  const DropdownKabupatenReg({super.key});

  @override
  Widget build(BuildContext context) {
    final DataPelangganRegController controller =
        Get.put(DataPelangganRegController());

    return Obx(() {
      return DropdownButtonFormField<int>(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        ),
        hint: const Text('Pilih Kabupaten'),
        value: controller.selectedKabupatenId.value == 0
            ? null
            : controller.selectedKabupatenId.value,
        items: controller.kabupaten.map((kab) {
          return DropdownMenuItem<int>(
            value: kab['id'],
            child: Text(kab['kabupaten']),
          );
        }).toList(),
        onChanged: (int? newValue) {
          if (newValue != null) {
            controller.selectedKabupatenId.value = newValue;
            controller.kabupatenName.value = controller.kabupaten
                .firstWhere((kab) => kab['id'] == newValue)['kabupaten'];
            controller.kecamatanName.value = ''; // Reset kecamatan value
            controller.fetchKecamatanByKabupatenId(newValue);
          }
        },
      );
    });
  }
}
