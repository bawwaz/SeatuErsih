import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/Home_Page/HomepageController.dart';
import 'package:seatu_ersih/app/pages/features/Home_Page/widget/ifempty.dart';
import 'package:seatu_ersih/app/pages/features/Home_Page/widget/ordercontainer.dart';
import 'package:seatu_ersih/app/router/app_pages.dart';
import 'package:seatu_ersih/themes/fonts.dart';
import 'package:shimmer/shimmer.dart';

class MyOrder extends GetView<HomePageController> {
  const MyOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final Map<String, String> tabs = {
        'pending': 'Pending',
        'waiting_for_payment': 'Waiting for Payment',
        'in-progress': 'In-Progress',
        'completed': 'Completed',
        'declined': 'Declined',
      };

      List<Widget> tabWidgets = tabs.entries.map((entry) {
        int count = controller.orders
            .where((order) => order['order_status'] == entry.key)
            .length;
        return Tab(text: count > 0 ? '${entry.value} ($count)' : entry.value);
      }).toList();

      List<Widget> tabViews = tabs.keys.map((status) {
        return RefreshIndicator(
          onRefresh: () async {
            await controller.forceReloadPage();
          },
          child: CustomScrollView(
            slivers: [
              if (controller.isLoading.value)
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        decoration: BoxDecoration(),
                        height: 20,
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 20.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    childCount: 6,
                  ),
                )
              else if (controller.orders.isEmpty ||
                  controller.orders
                      .where((order) => order['order_status'] == status)
                      .isEmpty)
                SliverFillRemaining(
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 80.0),
                    child: ImgIfEmpty(),
                  )),
                )
              else
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      Map<dynamic, dynamic> order = controller.orders
                          .where((order) => order['order_status'] == status)
                          .toList()[index];
                      return InkWell(
                        onTap: () {
                          Get.toNamed(
                            Routes.ORDER_DETAIL,
                            arguments: {
                              'orderList': order,
                              'orderStatus': order['id'],
                            },
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: OrderContainer(
                            title: order['order_type'] == "regular_clean"
                                ? "Regular Cleaning"
                                : "Deep Cleaning",
                            pickupDate: controller
                                .formatDate(order['pickup_date'].toString()),
                            price: controller
                                .formatPrice(order['total_price'].toString()),
                            status: order['order_status'],
                            id: order['id'],
                            decline_note: order['decline_note'],
                          ),
                        ),
                      );
                    },
                    childCount: controller.orders
                        .where((order) => order['order_status'] == status)
                        .length,
                  ),
                ),
            ],
          ),
        );
      }).toList();

      return DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              'My orders',
              style: Fonts.header1blu,
            ),
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50.0),
              child: TabBar(
                isScrollable: true,
                tabs: tabWidgets,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0), // Global padding
            child: TabBarView(
              children: tabViews,
            ),
          ),
        ),
      );
    });
  }
}
