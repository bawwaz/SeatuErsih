import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/order_detail/order_detailController.dart';
import 'package:seatu_ersih/app/pages/features/order_detail/widget/order_detail_contact_widget.dart';
import 'package:seatu_ersih/app/pages/features/order_detail/widget/order_detail_container_widget.dart';
import 'package:seatu_ersih/app/router/app_pages.dart';
import 'package:seatu_ersih/themes/colors.dart';
import 'package:seatu_ersih/themes/fonts.dart';

class OrderDetailView extends GetView<OrderDetailcontroller> {
  const OrderDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<dynamic, dynamic> order = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Order Detail'),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Order',
                        style: Fonts.header1.copyWith(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  DetailContainerWidget(
                    productName: order['order_type'] == "regular_clean"
                        ? "Regular Clean"
                        : "Deep Clean",
                    productStatus: order['order_status'],
                    pickupDate: '${order['pickup_date']}',
                    noteOrder: '${order['notes']}',
                    price: '${order['total_price']}',
                    id: order['id'], // Tampilkan id atau data lainnya
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 20),
                      child: Text(
                        'Contact',
                        style: Fonts.header1.copyWith(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  OrderDetailContactWidget(
                    alamat: '${order['detail_address']}',
                    phone: '${order['phone']}',
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              onTap: order['order_status'] == 'completed'
                  ? () {
                      Get.toNamed(Routes.RATING, arguments: order);
                    }
                  : null,
              child: Container(
                width: double.infinity,
                height: 55,
                decoration: BoxDecoration(
                  color: order['order_status'] == 'completed'
                      ? AppColors.primaryColor
                      : Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Berikan Ulasan',
                    style: Fonts.header1.copyWith(
                      fontWeight: FontWeight.w100,
                      fontSize: 18,
                      color: order['order_status'] == 'completed'
                          ? Colors.white
                          : Colors.black54,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
