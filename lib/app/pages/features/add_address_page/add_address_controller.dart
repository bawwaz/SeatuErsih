import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:seatu_ersih/app/api/add_address/service/add_address_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddAddressController extends GetxController {
  late TextEditingController phoneController;
  late TextEditingController cityController;
  late TextEditingController streetController;
  late TextEditingController detailStreetController;
  late TextEditingController detailLocationController;

  late AddAddressService addAddressService;

  @override
  void onInit() {
    phoneController = TextEditingController();
    cityController = TextEditingController();
    streetController = TextEditingController();
    detailStreetController = TextEditingController();
    detailLocationController = TextEditingController();

    addAddressService = AddAddressService();
    super.onInit();
  }

  Future<void> addAddress() async {
    try {
      dio.FormData formData = dio.FormData.fromMap({
        'phone': phoneController.text.toString(),
        'city': cityController.text,
        'street': streetController.text,
        'detail_street': detailStreetController.text,
        'detail_location': detailLocationController.text,
      });

      final response = await addAddressService.addAddress(formData);
      print(response.data['token'].toString());
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', response.data['token']);
      Get.snackbar("Alamat Berhasil Ditambahkan", "Welcome Back!");
    } catch (e) {
      print(e);
    }
  }
}
