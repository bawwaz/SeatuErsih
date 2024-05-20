import 'package:get/get.dart';
import 'package:seatu_ersih/view/HomepageView.dart';
import 'package:seatu_ersih/view/login_page/LoginpageView.dart';
import 'package:seatu_ersih/view/order_booking_deep/order_booking_deep_view.dart';
import 'package:seatu_ersih/view/profile_page/profileView.dart';
import 'package:seatu_ersih/view/register_page/RegisterviewPage.dart';

class Routes {
  static String home = '/home';
  static String login = '/log';
  static String regis = '/regis';
  static String profile = '/profile';
  static String orderbookingdeep = '/orderdeep';

  static List<GetPage> pages = [
    GetPage(name: home, page: () => HomePage()),
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: regis, page: () => Registerpage()),
    GetPage(name: profile, page: ()=> ProfilePage()),
    GetPage(name: orderbookingdeep, page: ()=> OrderBookingDeepView()),
  ];
}
