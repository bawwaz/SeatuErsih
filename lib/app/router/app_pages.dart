import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/Home_Page/HomepageBinding.dart';
import 'package:seatu_ersih/app/pages/features/checkout_Animation/animationBinding.dart';
import 'package:seatu_ersih/app/pages/features/checkout_Order/checkout_order_binding.dart';
import 'package:seatu_ersih/app/pages/features/order_booking_deep/order_booking_deepBinding.dart';
import 'package:seatu_ersih/app/pages/features/order_booking_regular/order_booking_regularBinding.dart';
import 'package:seatu_ersih/app/pages/features/order_detail/order_detailBinding.dart';
import 'package:seatu_ersih/app/pages/features/orderstatus/order_statusBinding.dart';
import 'package:seatu_ersih/app/pages/features/profile_Information/profileInfoView.dart';
import 'package:seatu_ersih/app/pages/features/profile_page/profileBinding.dart';
import 'package:seatu_ersih/app/pages/global_component/navbar/navbar.dart';
import 'package:seatu_ersih/app/pages/features/Home_Page/HomepageView.dart';
import 'package:seatu_ersih/app/pages/features/checkout_Animation/success_animation.dart';
import 'package:seatu_ersih/app/pages/features/checkout_Order/checkout_order_view.dart';
import 'package:seatu_ersih/app/pages/global_component/navbar/navbarBinding.dart';
import 'package:seatu_ersih/app/pages/intial_pages/login_page/LoginpageView.dart';
import 'package:seatu_ersih/app/pages/features/order_booking_deep/order_booking_deep_view.dart';
import 'package:seatu_ersih/app/pages/features/order_booking_regular/order_booking_regular_view.dart';
import 'package:seatu_ersih/app/pages/features/order_detail/order_detail.dart';
import 'package:seatu_ersih/app/pages/features/orderstatus/order_status.dart';
import 'package:seatu_ersih/app/pages/features/profile_page/profileView.dart';
import 'package:seatu_ersih/app/pages/intial_pages/login_page/loginBinding.dart';
import 'package:seatu_ersih/app/pages/intial_pages/register_page/RegisterviewPage.dart';
import 'package:seatu_ersih/app/pages/features/checkout_Order/widget/order_detail.dart';
import 'package:seatu_ersih/app/pages/intial_pages/register_page/registerBinding.dart';


part 'routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: homePageBinding() ,
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginPageBindings(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.REGIS,
      page: () => RegisterPage(),
      binding: RegisterPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => ProfilePage(),
      binding: profileBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.ORDER_BOOKING_DEEP,
      page: () => OrderBookingDeepView(),
      binding: orderBookingDeepBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.ORDER_BOOKING_REGULAR,
      page: () => OrderBookingRegularView(),
      binding: orderBookingRegularBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.CHECKOUT,
      page: () => Checkout(),
      binding: checkoutOrderBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.BTMNAVBAR,
      page: () => BottomNavBar(),
      binding: navbarBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.ORDERS,
      page: () => myorder(),
      binding: orderStatusBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.STATUS_ORDER,
      page: () => status(),
      binding: orderDetailBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.CHECKOUT_ANIMATION,
      page: () => animationCheckout(),
      binding: animationBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.PROFILE_INFO,
      page: () => profileinfo(),
      binding: profileBinding(),
      transition: Transition.noTransition
    )
  ];
}
