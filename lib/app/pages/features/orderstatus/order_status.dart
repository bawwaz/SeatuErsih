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
        'in-progress': 'In-Progress',
        'completed': 'Completed',
        'declined': 'Declined',
      };

      // Create TabBar and TabBarView widgets
      List<Widget> tabWidgets = tabs.entries.map((entry) {
        // Count the number of orders for this status
        int count = controller.orders
            .where((order) => order['order_status'] == entry.key)
            .length;
        return Tab(text: count > 0 ? '${entry.value} ($count)' : entry.value);
      }).toList();

      List<Widget> tabViews = tabs.keys.map((status) {
        return RefreshIndicator(
          onRefresh: controller.refreshOrders, // Refresh logic
          child: CustomScrollView(
            slivers: [
              Obx(
                () => controller.isLoading.value
                    ? SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 20.0,
                                    color: Colors.white,
                                  ),
                                  SizedBox(height: 10.0),
                                  Container(
                                    width: double.infinity,
                                    height: 20.0,
                                    color: Colors.white,
                                  ),
                                  SizedBox(height: 10.0),
                                  Container(
                                    width: 100.0,
                                    height: 20.0,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          childCount: 6,
                        ),
                      )
                    : controller.orders.isEmpty
                        ? SliverFillRemaining(
                            child: Center(child: ImgIfEmpty()),
                          )
                        : SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                Map<dynamic, dynamic> order =
                                    controller.orders[index];
                                if (order['order_status'] != status)
                                  return SizedBox.shrink();
                                return InkWell(
                                  onTap: () {
                                    Get.toNamed(Routes.ORDER_DETAIL,
                                        arguments: [order]);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    child: OrderContainer(
                                      title:
                                          order['order_type'] == "regular_clean"
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
                              childCount: controller.orders.length,
                            ),
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
              preferredSize: Size.fromHeight(50.0),
              child: TabBar(
                isScrollable: true,
                tabs: tabWidgets,
              ),
            ),
          ),
          body: TabBarView(
            children: tabViews,
          ),
        ),
      );
    });
  }
}
