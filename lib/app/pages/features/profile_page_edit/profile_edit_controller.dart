import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:seatu_ersih/app/api/api_endpoint.dart';

class ProfileEditController extends GetxController {
  final textNamaController = TextEditingController();
  final textEmailController = TextEditingController();
  final textPhoneController = TextEditingController();

  late final dynamic arguments;
  final box = GetStorage();
  final users = {}.obs;

  Rx<File?> image = Rx<File?>(null);

  @override
  void onInit() {
    // TODO: implement onInit
    arguments = Get.arguments;
    users.value = arguments[0] as Map<dynamic, dynamic>;
    initUsersData();
    super.onInit();
  }

  Future<void> initUsersData() async {
    // Print user data for debugging
    print(users.value);

    textNamaController.text = users['username'] ?? '';
    textEmailController.text = users['email'] ?? '';
    textPhoneController.text = users['phone'] ?? '';
  }

  Future<void> updateUsers() async {
    final url = ApiEndpoint.baseUrl;
    final token = box.read('token');

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    var body = {
      'username': textNamaController.text,
      'email': textEmailController.text,
      'phone': textPhoneController.text,
    };

    var response = await http.post(Uri.parse('$url/users/update/all'),
        headers: headers, body: body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
      if (image.value != null) {
        await uploadImage();
      }
      Get.back();
    } else {
      Get.snackbar('Error', 'Failed to update profile');
    }
  }

  Future<void> uploadImage() async {
    final url = ApiEndpoint.baseUrl;
    final token = box.read('token');

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    var request = http.MultipartRequest(
        'POST', Uri.parse('$url/users/update/profile-picture'))
      ..headers.addAll(headers)
      ..files.add(await http.MultipartFile.fromPath(
          'profile_picture', image.value!.path));
    request.send();
    print('successs');
  }

  Future<void> pickImage() async {
    await ImagePicker().pickImage(source: ImageSource.gallery).then((value) {
      if (value != null) {
        image.value = File(value.path);
      }
    });
  }
}
