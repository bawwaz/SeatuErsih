import 'package:get/get.dart';
import 'package:seatu_ersih/routes/navbar.dart';
import 'package:seatu_ersih/view/Home_Page/HomepageView.dart';
import 'package:seatu_ersih/view/add_address_page/add_address_view.dart';
import 'package:seatu_ersih/view/checkout_Animation/success_animation.dart';
import 'package:seatu_ersih/view/checkout_Order/checkout_order_view.dart';
import 'package:seatu_ersih/view/login_page/LoginpageView.dart';
import 'package:seatu_ersih/view/order_booking_deep/order_booking_deep_view.dart';
import 'package:seatu_ersih/view/order_booking_regular/order_booking_regular_view.dart';
import 'package:seatu_ersih/view/order_detail/order_detail.dart';
import 'package:seatu_ersih/view/orderstatus/order_status.dart';
import 'package:seatu_ersih/view/profile_page/profileView.dart';
import 'package:seatu_ersih/view/register_page/RegisterviewPage.dart';
import 'package:flutter/animation.dart';
import 'package:seatu_ersih/widget/checkout_Order/order_detail.dart';

class Routes {
  static String home = '/home';
  static String login = '/log';
  static String regis = '/regis';
  static String profile = '/profile';
  static String orderbookingdeep = '/orderdeep';
  static String orderbookingregular = '/orderregular';
  static String checkout = '/checkout';
  static String btmnavbar = '/btmnavbar';
  static String orders = '/myorder';
  static String statusorder = '/status';
  static String checkoutanimation = '/checkoutsuccess';
  static String addadress = '/addaddress';

  static List<GetPage> pages = [
    GetPage(name: orders, page: () => myorder()),
    GetPage(name: home, page: () => HomePage()),
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: regis, page: () => RegisterPage()),
    GetPage(name: profile, page: () => ProfilePage()),
    GetPage(name: orderbookingdeep, page: () => OrderBookingDeepView()),
    GetPage(name: orderbookingregular, page: () => OrderBookingRegularView()),
    GetPage(name: checkout, page: () => Checkout()),
    GetPage(name: btmnavbar, page: () => BottomNavBar()),
    GetPage(name: statusorder, page: () => status()),
    GetPage(name: checkoutanimation, page: () => animationCheckout()),
    GetPage(name: addadress, page: () => AddAddressView()),
  ];
}
