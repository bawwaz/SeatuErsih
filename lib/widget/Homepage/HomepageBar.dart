import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppbarHome extends StatelessWidget {
  const AppbarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 68,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          color: Color(0xfff7EC1EB),
        ),
      ),
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Image(image: AssetImage('assets/img/icon.png')),
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width / 1.6,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xff545454),
              ),
            ),
          )
        ],
      ),
    ]);
  }
}
