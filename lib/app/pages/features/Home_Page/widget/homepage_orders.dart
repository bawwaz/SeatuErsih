import 'package:flutter/material.dart';

class HomePageOrders extends StatelessWidget {
  const HomePageOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7.0),
      child: Container(
        width: 306,
        height: 71,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 0.2,
                offset: Offset(0, 0),
              ),
            ]),
      ),
    );
  }
}
