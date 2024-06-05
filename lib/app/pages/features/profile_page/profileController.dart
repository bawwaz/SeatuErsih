import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  var username = ''.obs;
  var email = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadProfile();
  }

  void loadProfile() {
    GetStorage box = GetStorage();
    username.value = box.read('username') ?? 'No Username';
    email.value = box.read('email') ?? 'No email'; // Add phone number if available
  }
}
