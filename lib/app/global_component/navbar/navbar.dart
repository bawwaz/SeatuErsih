import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih/app/global_component/navbar/btmnavcontroller.dart';
import 'package:seatu_ersih/app/pages/features/Home_Page/HomepageView.dart';
import 'package:seatu_ersih/app/pages/features/profile_page/profileView.dart';
import 'package:seatu_ersih/themes/colors.dart';
import 'package:seatu_ersih/app/pages/features/orderstatus/order_status.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BottomNavigationController navController = Get.find();

    return Scaffold(
      body: Obx(() => _buildPage(navController.currentIndex.value)),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: navController.currentIndex.value,
          onTap: (index) {
            navController.currentIndex.value = index;
          },
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_laundry_service),
              label: 'My Orders',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        );
      }),
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return HomePage();
      case 1:
        return MyOrder();
      case 2:
        return ProfilePage();
      default:
        return HomePage();
    }
  }
}
