import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:seatu_ersih/app/api/auth/authentication_service.dart';
import 'package:seatu_ersih/app/router/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  var username = ''.obs;
  var phoneNumber = ''.obs;
  late AuthenticationService authenticationService;
  var email = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadProfile();
    authenticationService = AuthenticationService();
  }

  void loadProfile() {
    GetStorage box = GetStorage();
    username.value = box.read('username') ?? 'No Username';
    phoneNumber.value = box.read('phoneNumber') ?? 'No Phone Number';
  }

  Future<void> logout() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await authenticationService.logoutService();
      prefs.remove('token');
      Get.snackbar("Logout Successful", "You have been logged out.");
      Get.offAllNamed(Routes.LOGIN);
    } catch (e) {
      print("Logout error: $e");
      Get.snackbar(
        "Logout Failed",
        e.toString(),
      );
    }
    email.value = box.read('email') ?? 'No email'; // Add phone number if available
  }
}
