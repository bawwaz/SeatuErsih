import 'package:flutter/material.dart';
import 'package:seatu_ersih/themes/fonts.dart';

class OrderService extends StatelessWidget {
  const OrderService({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 126,
      width: MediaQuery.sizeOf(context).width * 0.9,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 2,
              spreadRadius: 1,
            )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/img/icon-app.png'),
          Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Text(
              'Order Service',
              style: Fonts.detailBold,
            ),
          ),
        ],
      ),
    );
  }
}
