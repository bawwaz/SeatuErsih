import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih/routes/routes.dart';
import 'package:seatu_ersih/widget/order_detail.dart/order_detailBody.dart';

class status extends StatelessWidget {
  const status({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Center(child: (DetailBody())),
    );
  }
}
