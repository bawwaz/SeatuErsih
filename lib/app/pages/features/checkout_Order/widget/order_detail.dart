import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/checkout_Order/checkout_order_Controller.dart';
import 'package:seatu_ersih/themes/fonts.dart';
import 'package:seatu_ersih/app/pages/features/checkout_Order/widget/greyLines.dart';

class OrderDetail extends GetView<CheckoutController> {
  const OrderDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.only(left: 22.0, right: 22, bottom: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Barang',
              style: Fonts.detailBold,
            ),
            SizedBox(height: 9),
            for (var shoe in controller.shoess)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      shoe['name'],
                      style: Fonts.detail,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '25000',
                    style: Fonts.detail,
                  ),
                ],
              ),
            SizedBox(height: 15),
            Lines(),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Rangkuman',
                  style: Fonts.detailBold,
                ),
                Text(
                  'Total',
                  style: Fonts.detailBold,
                ),
              ],
            ),
            SizedBox(height: 9),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Barang',
                  style: Fonts.detail,
                ),
                Text(
                  '${controller.shoess.length}',
                  style: Fonts.detail,
                ),
              ],
            ),
            SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Harga',
                  style: Fonts.detail,
                ),
                Text(
                  '${controller.shoess.length * 25000}',
                  style: Fonts.detail,
                ),
              ],
            ),
            SizedBox(height: 15),
            Lines(),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Schedule',
                  style: Fonts.detailBold,
                ),
                Text(
                  'Tanggal',
                  style: Fonts.detailBold,
                ),
              ],
            ),
            SizedBox(height: 9),
            Row(
              children: [
                Text(
                  'Pickup',
                  style: Fonts.detail,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 105.0),
                  child: Obx(
                    () => Text(
                      controller.pickupDate.value,
                      style: Fonts.detail,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 6),
          ],
        ),
      );
    });
  }
}
