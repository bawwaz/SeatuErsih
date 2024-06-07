import 'package:flutter/material.dart';

class OrderContainer extends StatelessWidget {
  const OrderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        height: 71,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 1.2,
                spreadRadius: 0,
                offset: Offset(0, 0),
              )
            ],
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
