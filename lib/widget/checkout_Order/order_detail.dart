import 'package:flutter/material.dart';
import 'package:seatu_ersih/themes/fonts.dart';
import 'package:seatu_ersih/widget/checkout_Order/greyLines.dart';

class orderdetail extends StatelessWidget {
  const orderdetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Barang',
              style: Fonts.detailBold,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 127.0),
              child: Text(
                'Harga',
                style: Fonts.detailBold,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 9,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Regular Clean',
              style: Fonts.detail,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 83.4),
              child: Text(
                '25.000',
                style: Fonts.detail,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Lines(),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Rangkuman',
              style: Fonts.detailBold,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100.0),
              child: Text(
                'Total',
                style: Fonts.detailBold,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 9,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Total Barang',
              style: Fonts.detail,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 125.0),
              child: Text(
                '2',
                style: Fonts.detail,
              ),
            )
          ],
        ),
        SizedBox(
          height: 6,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Total Harga',
              style: Fonts.detail,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 96.5),
              child: Text(
                '35.000',
                style: Fonts.detail,
              ),
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Lines(),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Schedule',
              style: Fonts.detailBold,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 96.0),
              child: Text(
                'Tanggal',
                style: Fonts.detailBold,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 9,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tanggal pengambilan',
              style: Fonts.detail,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22.0),
              child: Text(
                '10/4/25',
                style: Fonts.detail,
              ),
            )
          ],
        ),
        SizedBox(
          height: 6,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Estimasi Selesai',
              style: Fonts.detail,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60.0),
              child: Text(
                '12/4/25',
                style: Fonts.detail,
              ),
            )
          ],
        ),
      ],
    );
  }
}
