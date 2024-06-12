import 'package:flutter/material.dart';
import 'package:seatu_ersih/app/pages/features/order_detail/widget/order_detail_contact_widget.dart';
import 'package:seatu_ersih/app/pages/features/order_detail/widget/order_detail_container_widget.dart';
import 'package:seatu_ersih/themes/colors.dart';
import 'package:seatu_ersih/themes/fonts.dart';

class OrderDetailView extends StatelessWidget {
  const OrderDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Detail'),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Order',
                        style: Fonts.header1.copyWith(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  DetailContainerWidget(
                    productName: 'Regular Clean',
                    productStatus: 'Completed',
                    pickupDate: '08/06/24',
                    noteOrder: 'Tiati bersihin nya mas',
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 20),
                      child: Text(
                        'Contact',
                        style: Fonts.header1.copyWith(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  OrderDetailContactWidget(
                    alamat: 'Jl.Besito',
                    phone: '0812828',
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: double.infinity,
                height: 55,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Berikan Ulasan',
                    style: Fonts.header1
                        .copyWith(fontWeight: FontWeight.w100, fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
