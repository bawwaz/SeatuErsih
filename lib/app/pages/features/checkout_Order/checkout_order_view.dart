import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/checkout_Order/widget/ordernow.dart';
import 'package:seatu_ersih/app/pages/features/checkout_Order/widget/checkout_receipt.dart';
import 'package:seatu_ersih/app/router/app_pages.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: InkWell(
          onTap: () {
            Get.back();
          },
          child: Image.asset('assets/img/angle-circle-right 1.png'),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 55,
          ),
          Center(child: receipt()),
        ],
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: ordernow(),
      ),
    );
  }
}
