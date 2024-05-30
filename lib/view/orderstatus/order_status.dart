import 'package:flutter/material.dart';
import 'package:seatu_ersih/themes/fonts.dart';
import 'package:seatu_ersih/widget/Orderstatus/orderCards.dart';

class myorder extends StatelessWidget {
  const myorder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: InkWell(
          onTap: () {},
          child: Text(
            'My orders',
            style: Fonts.header1blu,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 2,
          ),
          Center(child: OrderCard()),
        ],
      ),
    );
  }
}
