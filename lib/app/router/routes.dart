// import 'package:get/get.dart';
// import 'package:seatu_ersih/app/pages/global_component/navbar/navbar.dart';
// import 'package:seatu_ersih/app/pages/features/Home_Page/HomepageView.dart';
// import 'package:seatu_ersih/app/pages/features/checkout_Animation/success_animation.dart';
// import 'package:seatu_ersih/app/pages/features/checkout_Order/checkout_order_view.dart';
// import 'package:seatu_ersih/app/pages/intial_pages/login_page/LoginpageView.dart';
// import 'package:seatu_ersih/app/pages/features/order_booking_deep/order_booking_deep_view.dart';
// import 'package:seatu_ersih/app/pages/features/order_booking_regular/order_booking_regular_view.dart';
// import 'package:seatu_ersih/app/pages/features/order_detail/order_detail.dart';
// import 'package:seatu_ersih/app/pages/features/orderstatus/order_status.dart';
// import 'package:seatu_ersih/app/pages/features/profile_page/profileView.dart';
// import 'package:seatu_ersih/app/pages/intial_pages/register_page/RegisterviewPage.dart';
// import 'package:flutter/animation.dart';
// import 'package:seatu_ersih/app/pages/features/checkout_Order/widget/order_detail.dart';

// class Routes {
//   static String home = '/home';
//   static String login = '/log';
//   static String regis = '/regis';
//   static String profile = '/profile';
//   static String orderbookingdeep = '/orderdeep';
//   static String orderbookingregular = '/orderregular';
//   static String checkout = '/checkout';
//   static String btmnavbar = '/btmnavbar';
//   static String orders = '/myorder';
//   static String statusorder = '/status';
//   static String checkoutanimation = '/checkoutsuccess';

//   static List<GetPage> pages = [
//     GetPage(name: orders, page: () => myorder()),
//     GetPage(name: home, page: () => HomePage()),
//     GetPage(name: login, page: () => LoginPage()),
//     GetPage(name: regis, page: () => RegisterPage()),
//     GetPage(name: profile, page: () => ProfilePage()),
//     GetPage(name: orderbookingdeep, page: () => OrderBookingDeepView()),
//     GetPage(name: orderbookingregular, page: () => OrderBookingRegularView()),
//     GetPage(name: checkout, page: () => Checkout()),
//     GetPage(name: btmnavbar, page: () => BottomNavBar()),
//     GetPage(name: statusorder, page: () => status()),
//     GetPage(name: checkoutanimation, page: () => animationCheckout()),

//   ];

// }
part of 'app_pages.dart';

class Routes {
  static const String HOME = '/home';
  static const String LOGIN = '/log';
  static const String REGIS = '/regis';
  static const String PROFILE = '/profile';
  static const String ORDER_BOOKING_DEEP = '/orderdeep';
  static const String ORDER_BOOKING_REGULAR = '/orderregular';
  static const String CHECKOUT = '/checkout';
  static const String BTMNAVBAR = '/btmnavbar';
  static const String ORDERS = '/myorder';
  static const String STATUS_ORDER = '/status';
  static const String CHECKOUT_ANIMATION = '/checkoutsuccess';
  static const String SAVED_ADDRESS = '/savedaddress';
  static const String ADD_ADDRESS = '/addaddress';
  static const String ADDRESS_DETAIL = '/addressdetail';
  static const String PROFILE_INFO = '/profile_info';
}
