import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih/view/Home_Page/HomepageView.dart';
import 'package:seatu_ersih/view/order_booking_deep/order_booking_deep_view.dart';
import 'package:seatu_ersih/view/order_booking_regular/order_booking_regular_view.dart';
import 'package:seatu_ersih/themes/colors.dart';

class BottomNavigationController extends GetxController {
  var currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
  }
}

class BottomNavBar extends StatelessWidget {
  final BottomNavigationController controller =
      Get.put(BottomNavigationController());

  final List<Widget> pages = [HomePage(), OrderBookingDeepView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages[controller.currentIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changePage,
          selectedItemColor:
              AppColors.primaryColor, // replace with your ColorResources.gold
          backgroundColor:
              Colors.white, // replace with your ColorResources.white
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'History'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
