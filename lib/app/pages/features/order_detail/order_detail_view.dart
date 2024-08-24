import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/order_detail/order_detailController.dart';
import 'package:seatu_ersih/app/pages/features/order_detail/widget/order_detail_contact_widget.dart';
import 'package:seatu_ersih/app/pages/features/order_detail/widget/order_detail_container_widget.dart';
import 'package:seatu_ersih/app/pages/features/payment_confirmation_page/payment_confirmation_controller.dart';
import 'package:seatu_ersih/app/router/app_pages.dart';
import 'package:seatu_ersih/themes/colors.dart';
import 'package:seatu_ersih/themes/fonts.dart';

class OrderDetailView extends StatelessWidget {
  final OrderDetailcontroller orderDetailController =
      Get.find<OrderDetailcontroller>();
  final PaymentConfirmationController paymentController =
      Get.put(PaymentConfirmationController());

  OrderDetailView({super.key});

  @override
  Widget build(BuildContext context) {
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
                    productName: orderDetailController.orders['order_type'] ==
                            "regular_clean"
                        ? "Regular Clean"
                        : "Deep Clean",
                    productStatus: orderDetailController.orders['order_status'],
                    pickupDate:
                        '${orderDetailController.formatDate(orderDetailController.orders['pickup_date'].toString())}',
                    noteOrder: '${orderDetailController.orders['notes']}',
                    price: '${orderDetailController.orders['total_price']}',
                    id: int.parse(
                        orderDetailController.orders['id'].toString()),
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
                    alamat: '${orderDetailController.orders['detail_address']}',
                    phone: '${orderDetailController.orders['phone']}',
                  ),
                ],
              ),
            ),
          ),
          // "Pay Now" button for 'waiting_for_payment' status
          if (orderDetailController.orders['order_status'] ==
              'waiting_for_payment')
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () async {
                  await paymentController.fetchShoe();
                  _handlePayment(paymentController).then((paymentCreated) {
                    if (paymentCreated) {
                      Get.offAllNamed(Routes.BTMNAVBAR);
                    } else {
                      Get.snackbar('Error',
                          'Failed to create payment: ${paymentController.errorMessage}');
                    }
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Pay Now',
                      style: Fonts.header1.copyWith(
                        fontWeight: FontWeight.w100,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          // "Berikan Ulasan" button for 'completed' status
          if (orderDetailController.orders['order_status'] == 'completed')
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.RATING,
                      arguments: orderDetailController.orders);
                },
                child: Container(
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Berikan Ulasan',
                      style: Fonts.header1.copyWith(
                        fontWeight: FontWeight.w100,
                        fontSize: 18,
                        color: Colors.white,
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

  Future<bool> _handlePayment(
      PaymentConfirmationController paymentController) async {
    final paymentCreated = await paymentController.createPayment();
    if (paymentCreated && paymentController.checkoutLink != null) {
      paymentController
          .proceedToPayment(Uri.parse(paymentController.checkoutLink!));
    }
    return paymentCreated;
  }
}
