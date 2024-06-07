import 'package:flutter/material.dart';
import 'package:seatu_ersih/app/pages/features/Home_Page/widget/ordercontainer.dart';
import 'package:seatu_ersih/themes/fonts.dart';
import 'package:seatu_ersih/app/pages/features/orderstatus/widget/orderCards.dart';

class myorder extends StatelessWidget {
  const myorder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'My orders',
          style: Fonts.header1blu,
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 2,
            ),
            Center(child: OrderContainer()),
          ],
        ),
      ),
    );
  }
}
