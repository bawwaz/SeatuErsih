import 'package:flutter/material.dart';
import 'package:seatu_ersih/app/pages/features/order_detail/widget/order_detailBody.dart';

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
