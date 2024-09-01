import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:seatu_ersih/app/api/api_endpoint.dart';
import 'package:seatu_ersih/app/api/auth/authentication_service.dart';
import 'package:seatu_ersih/app/router/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  var username = ''.obs;
  var phoneNumber = ''.obs;
  late AuthenticationService authenticationService;
  var email = ''.obs;
  var isLoading = false.obs;

  final users = {}.obs;
  final box = GetStorage();
  final url = ApiEndpoint.baseUrl;

  @override
  void onInit() {
    super.onInit();
    fetchUser();
    loadProfile();
    authenticationService = AuthenticationService();
  }

  void loadProfile() {
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
    email.value = box.read('email') ?? 'No email';
  }

  Future<void> fetchUser() async {
    isLoading.value = true;
    final token = box.read('token');
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

      final response =
          await http.get(Uri.parse('$url/users/detail'), headers: headers);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body)['user'];
        users.value = jsonData;
      } else {
        print("Failed to fetch user");
      }
    } catch (e) {
      print("Fetch user error: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
