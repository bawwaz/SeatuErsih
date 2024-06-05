import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  var username = ''.obs;
  var phoneNumber = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadProfile();
  }

  void loadProfile() {
    GetStorage box = GetStorage();
    username.value = box.read('username') ?? 'No Username';
    phoneNumber.value = box.read('phoneNumber') ?? 'No Phone Number'; // Add phone number if available
  }
}
