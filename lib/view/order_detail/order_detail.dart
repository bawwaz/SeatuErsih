import 'package:flutter/material.dart';
import 'package:seatu_ersih/widget/order_detail.dart/order_detailBody.dart';

class status extends StatelessWidget {
  const status({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image.asset('assets/img/angle-circle-right 1.png'),
      ),
      body: Center(child: (DetailBody())),
    );
  }
}
