import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/Home_Page/HomepageBinding.dart';
import 'package:seatu_ersih/app/pages/features/add_address_page/add_address_binding.dart';
import 'package:seatu_ersih/app/pages/features/add_address_page/add_address_view.dart';
import 'package:seatu_ersih/app/pages/features/add_ons_page/add_ons_binding.dart';
import 'package:seatu_ersih/app/pages/features/add_ons_page/add_ons_view.dart';
import 'package:seatu_ersih/app/pages/features/address_detail_page/address_detail_binding.dart';
import 'package:seatu_ersih/app/pages/features/address_detail_page/address_detail_view.dart';
import 'package:seatu_ersih/app/pages/features/available_coupons_page/available_coupons_bindings.dart';
import 'package:seatu_ersih/app/pages/features/available_coupons_page/available_coupons_view.dart';
import 'package:seatu_ersih/app/pages/features/checkout_Animation/animationBinding.dart';
import 'package:seatu_ersih/app/pages/features/checkout_Order/checkout_order_binding.dart';
import 'package:seatu_ersih/app/pages/features/choose_service/choose_service_binding.dart';
import 'package:seatu_ersih/app/pages/features/choose_service/choose_service_view.dart';
import 'package:seatu_ersih/app/pages/features/data_pelanggan_deep/data_pelanggan_binding_deep.dart';
import 'package:seatu_ersih/app/pages/features/data_pelanggan_deep/data_pelanggan_view_deep.dart';
import 'package:seatu_ersih/app/pages/features/data_pelanggan_reg/data_pelanggan_binding_reg.dart';
import 'package:seatu_ersih/app/pages/features/data_pelanggan_reg/data_pelanggan_view_reg.dart';
import 'package:seatu_ersih/app/pages/features/deep_shoe_list/deep_clean_list_binding.dart';
import 'package:seatu_ersih/app/pages/features/deep_shoe_list/deep_clean_list_view.dart';
import 'package:seatu_ersih/app/pages/features/my_shoe_data/myshoe_bindings.dart';
import 'package:seatu_ersih/app/pages/features/my_shoe_data/myshoe_view.dart';
import 'package:seatu_ersih/app/pages/features/order_detail/order_detail_view.dart';
import 'package:seatu_ersih/app/pages/features/payment_confirmation_page/payment_confirmation_binding.dart';
import 'package:seatu_ersih/app/pages/features/payment_confirmation_page/payment_confirmation_view.dart';
import 'package:seatu_ersih/app/pages/features/payment_history_page/paymenthistoryBinding.dart';
import 'package:seatu_ersih/app/pages/features/payment_history_page/paymenthistoryView.dart';
import 'package:seatu_ersih/app/pages/features/order_booking_deep/order_booking_deepBinding.dart';
import 'package:seatu_ersih/app/pages/features/order_booking_regular/order_booking_regularBinding.dart';
import 'package:seatu_ersih/app/pages/features/order_detail/order_detailbinding.dart';
import 'package:seatu_ersih/app/pages/features/orderstatus/order_statusBinding.dart';
import 'package:seatu_ersih/app/pages/features/profile_Information/profileInfoView.dart';
import 'package:seatu_ersih/app/pages/features/profile_page/profileBinding.dart';
import 'package:seatu_ersih/app/global_component/navbar/navbar.dart';
import 'package:seatu_ersih/app/pages/features/Home_Page/HomepageView.dart';
import 'package:seatu_ersih/app/pages/features/checkout_Animation/success_animation.dart';
import 'package:seatu_ersih/app/pages/features/checkout_Order/checkout_order_view.dart';
import 'package:seatu_ersih/app/pages/features/profile_page_edit/profile_edit_binding.dart';
import 'package:seatu_ersih/app/pages/features/profile_page_edit/profile_edit_view.dart';
import 'package:seatu_ersih/app/pages/features/rating_page/rating_binding.dart';
import 'package:seatu_ersih/app/pages/features/rating_page/rating_view.dart';
import 'package:seatu_ersih/app/pages/features/regular_shoe_list/regular_clean_list_binding.dart';
import 'package:seatu_ersih/app/pages/features/regular_shoe_list/regular_clean_list_view.dart';
import 'package:seatu_ersih/app/pages/features/saved_address_page/saved_address_binding.dart';
import 'package:seatu_ersih/app/pages/features/saved_address_page/saved_address_view.dart';
import 'package:seatu_ersih/app/pages/intial_pages/login_page/LoginpageView.dart';
import 'package:seatu_ersih/app/pages/features/order_booking_deep/order_booking_deep_view.dart';
import 'package:seatu_ersih/app/pages/features/order_booking_regular/order_booking_regular_view.dart';
import 'package:seatu_ersih/app/pages/features/orderstatus/order_status.dart';
import 'package:seatu_ersih/app/pages/features/profile_page/profileView.dart';
import 'package:seatu_ersih/app/pages/intial_pages/login_page/loginBinding.dart';
import 'package:seatu_ersih/app/pages/intial_pages/onboarding/boardingscreen.dart';
import 'package:seatu_ersih/app/pages/intial_pages/otp_page/otp_page_binding.dart';
import 'package:seatu_ersih/app/pages/intial_pages/otp_page/otp_page_view.dart';
import 'package:seatu_ersih/app/pages/intial_pages/register_page/RegisterviewPage.dart';
import 'package:seatu_ersih/app/pages/intial_pages/register_page/registerBinding.dart';

part 'routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: Routes.CHOOSE_SERVICE,
      page: () => ChooseService(),
      binding: ChooseServiceBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: homePageBinding(),
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
      bindings: [
        homePageBinding(),
        paymenthistoryBinding(),
        orderStatusBinding(),
      ],
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.ORDERS,
      page: () => MyOrder(),
      binding: orderStatusBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.CHECKOUT_ANIMATION,
      page: () => AnimationCheckoutView(),
      binding: AnimationBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.SAVED_ADDRESS,
      page: () => SavedAddressView(),
      binding: SavedAddressBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.ADD_ADDRESS,
      page: () => AddAddressView(),
      binding: AddAddressBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.ADDRESS_DETAIL,
      page: () => AddressDetailView(),
      binding: AddressDetailBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.PROFILE_INFO,
      page: () => profileinfo(),
      binding: profileBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.HISTORY_PAYMENT,
      page: () => PaymentHistory(),
      binding: paymenthistoryBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.ONBOARDING,
      page: () => OnBoarding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.DATA_PELANGGAN_DEEP,
      page: () => DataPelangganDeepView(),
      binding: DataPelangganDeepBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.DATA_PELANGGAN_REG,
      page: () => DataPelangganRegView(),
      binding: DataPelangganRegBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.REG_CLEAN_LIST,
      page: () => RegCleanListView(),
      binding: RegCleanListBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.ADD_ONS,
      page: () => AddOnsView(),
      binding: AddOnsBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.DEEP_CLEAN_LIST,
      page: () => DeepCleanListView(),
      binding: DeepCleanListBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.PROFILE_EDIT,
      page: () => ProfileEditView(),
      binding: ProfileEditBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.ORDER_DETAIL,
      page: () => OrderDetailView(),
      binding: orderDetailBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.PAYMENT_CONFIRMATION,
      page: () => PaymentConfirmationView(),
      binding: PaymentConfirmationBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.RATING,
      page: () => RatingView(),
      binding: RatingBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.OTP,
      page: () => OtpPageView(),
      binding: OtpPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
        name: Routes.AVAILABLECOUPONS,
        page: () => AvailableCoupon(),
        binding: AvailableCouponBindings(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.MYSHOES,
        page: () => Myshoes(),
        binding: MyShoesBindings(),
        transition: Transition.noTransition),
  ];
}
