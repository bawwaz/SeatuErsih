import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
        final BottomNavigationController navController = Get.find();
        return BottomNavigationBar(
          currentIndex: navController.currentIndex.value,
          onTap: (index) {
            navController.currentIndex.value = index;
          },
          backgroundColor: Colors.white,
          selectedItemColor: Color(0xFF7EC1EB),
          unselectedItemColor: Color(0xFF607D8B),
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svg/home.svg',
                height: navController.currentIndex.value == 0 ? 28.0 : 24.0,
                color: navController.currentIndex.value == 0
                    ? Color(0xFF7EC1EB)
                    : Color(0xFF607D8B),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svg/Bag.svg',
                height: navController.currentIndex.value == 1 ? 28.0 : 24.0,
                color: navController.currentIndex.value == 1
                    ? Color(0xFF7EC1EB)
                    : Color(0xFF607D8B),
              ),
              label: 'My order',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/svg/user.svg",
                height: navController.currentIndex.value == 2 ? 28.0 : 24.0,
                color: navController.currentIndex.value == 2
                    ? Color(0xFF7EC1EB)
                    : Color(0xFF607D8B),
              ),
              label: 'Me',
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
