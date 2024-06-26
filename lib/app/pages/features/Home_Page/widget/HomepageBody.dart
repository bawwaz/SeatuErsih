import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/Home_Page/HomepageController.dart';
import 'package:seatu_ersih/app/pages/features/Home_Page/widget/ifempty.dart';
import 'package:seatu_ersih/app/pages/features/Home_Page/widget/ordercontainer.dart';
import 'package:seatu_ersih/app/pages/features/profile_page/profileController.dart';
import 'package:seatu_ersih/app/router/app_pages.dart';
import 'package:seatu_ersih/themes/colors.dart';
import 'package:seatu_ersih/themes/fonts.dart';
import 'package:seatu_ersih/app/pages/features/Home_Page/widget/orderservice.dart';
import 'package:seatu_ersih/app/pages/features/Home_Page/widget/bannerslogan.dart';

class HomeBody extends GetView<HomePageController> {
  
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(ProfileController());
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome,',
                    style: Fonts.slogan,
                  ),
                  Obx(
                    () => Text(
                      profileController.username.value,
                      style: Fonts.slogan,
                    ),
                  ),
                ],
              ),
            ),
            Center(
                child: Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.CHOOSE_SERVICE);
                },
                child: OrderService(),
              ),
            ))
          ]),
          SizedBox(
            height: 31,
          ),
          Center(
            child: BannerSlogan(),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'My Orders',
              style: Fonts.header1.copyWith(color: Colors.black),
            ),
          ),
          Obx(
            () => controller.orders.isEmpty
                ? Center(child: ImgIfEmpty())
                : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.orders.length,
                    itemBuilder: (context, index) {
                      Map<dynamic, dynamic> order = controller.orders[index];
                      return InkWell(
                        onTap: () {
                          Get.toNamed(Routes.ORDER_DETAIL, arguments: [order]);
                        },
                        child: Container(
                            margin: EdgeInsets.only(left: 20, right: 20),
                            child: OrderContainer(
                              title: order['order_type'] == "regular_clean"
                                  ? "Regular Cleaning"
                                  : "Deep Cleaning",
                              pickupDate: controller
                                  .formatDate(order['pickup_date'].toString()),
                              price: controller.formatPrice(
                                  int.parse(order['total_price'].toString())),
                            )),
                      );
                    },
                  ),
          )
        ],
      ),
    );
  }
}
