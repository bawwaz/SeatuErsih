import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/Home_Page/HomepageController.dart';
import 'package:seatu_ersih/app/pages/features/Home_Page/widget/ifempty.dart';
import 'package:seatu_ersih/app/pages/features/Home_Page/widget/ordercontainer.dart';
import 'package:seatu_ersih/app/pages/features/orderstatus/order_statusController.dart';
import 'package:seatu_ersih/app/router/app_pages.dart';
import 'package:seatu_ersih/themes/fonts.dart';

class MyOrder extends GetView<HomePageController> {
  const MyOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'My orders',
          style: Fonts.header1blu,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 2,
              ),
              Obx(
                () => controller.orders.isEmpty
                    ? Center(child: ImgIfEmpty())
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.orders.length,
                        itemBuilder: (context, index) {
                          Map<dynamic, dynamic> order =
                              controller.orders[index];
                          return InkWell(
                            onTap: () {
                              Get.toNamed(Routes.ORDER_DETAIL,
                                  arguments: [order]);
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 20, right: 20),
                              child: OrderContainer(
                                title: order['order_type'] == "regular_clean"
                                    ? "Regular Cleaning"
                                    : "Deep Cleaning",
                                pickupDate: controller.formatDate(
                                    order['pickup_date'].toString()),
                                price: controller.formatPrice(
                                    order['total_price'].toString()),
                                status: order['order_status'],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
