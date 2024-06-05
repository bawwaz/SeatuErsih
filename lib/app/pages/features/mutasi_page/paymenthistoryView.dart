import 'package:flutter/material.dart';
import 'package:seatu_ersih/app/pages/features/mutasi_page/widget/paymenthistoryitems.dart';
import 'package:seatu_ersih/themes/fonts.dart';

class paymentHistory extends StatelessWidget {
  const paymentHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Mutasi',
          style: Fonts.header1blu,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: PaymentItems(),
      ),
    );
  }
}
