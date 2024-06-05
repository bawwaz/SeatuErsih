import 'package:get/get.dart';
import 'package:seatu_ersih/app/api/database/seatuersihRegister.dart';
import 'package:seatu_ersih/app/router/app_pages.dart';

class profileInfoController extends GetxController {
    final ApiService apiService = ApiService();

  var isLoading = false.obs;
  var username = ''.obs;
  var email = ''.obs;
  var phone = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  void fetchUserData() async {
    isLoading.value = true;

    try {
      // Assume getUserInfo() is a method in ApiService that fetches the user information
      var userData = await apiService.getUserInfo();
      username.value = userData['username'];
      email.value = userData['email'];
      phone.value = userData['phone'];
    } catch (e) {
      // Handle error
      print('Network error: $e');
      Get.snackbar('Error', 'Failed to fetch user data');
    } finally {
      isLoading.value = false;
    }
  }

  void logout() {
    // Clear user data and navigate to login page
    username.value = '';
    email.value = '';
    phone.value = '';
    Get.offAllNamed(Routes.LOGIN);
  }
}