import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/my_shoe_data/myshoe_contoller.dart';
import 'package:seatu_ersih/app/pages/features/my_shoe_data/widgets/shoedetailwidget.dart';

class Myshoes extends StatelessWidget {
  final MyShoeController controller = Get.put(MyShoeController());

  @override
  Widget build(BuildContext context) {
    final int orderId = Get.arguments != null ? Get.arguments['id'] : null;

    if (orderId != null) {
      controller.fetchShoebyId(orderId);
    } else {
      return Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: Image.asset('assets/img/angle-circle-right 1.png')),
          title: Text('Sepatu saya'),
          centerTitle: true,
        ),
        body: Center(
          child: Text('Invalid order ID'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Image.asset('assets/img/angle-circle-right 1.png')),
        title: Text('Sepatu saya'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.shoeData.isEmpty) {
          return Center(child: Text('No shoes found.'));
        } else {
          return ListView.builder(
            itemCount: controller.shoeData.length,
            itemBuilder: (context, index) {
              final shoe = controller.shoeData[index];
              return ShoeDetailWidget(
                shoeName: shoe['brand'] ?? 'Unknown Brand',
                addOns: shoe['addons'] ?? 'No Add-ons',
                notes: shoe['notes'] ?? 'No Notes',
              );
            },
          );
        }
      }),
    );
  }
}
