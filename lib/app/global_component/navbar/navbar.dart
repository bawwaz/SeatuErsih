import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih/app/global_component/navbar/btmnavcontroller.dart';
import 'package:seatu_ersih/app/pages/features/Home_Page/HomepageView.dart';
import 'package:seatu_ersih/app/pages/features/mutasi_page/paymenthistoryView.dart';
import 'package:seatu_ersih/themes/colors.dart';
import 'package:seatu_ersih/app/pages/features/orderstatus/order_status.dart';

class BottomNavBar extends StatelessWidget {
  final BottomNavigationController controller =
      Get.put(BottomNavigationController());

  final List<Widget> pages = [
    HomePage(),
    paymentHistory(),
    myorder(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages[controller.currentIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changePage,
          selectedItemColor: Colors.white,
          backgroundColor: AppColors.primaryColor,
          unselectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Mutasi'),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_laundry_service), label: 'My Orders'),
          ],
        ),
      ),
    );
  }
}
