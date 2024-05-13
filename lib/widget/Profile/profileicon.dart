import 'package:flutter/material.dart';

class pfp extends StatelessWidget {
  const pfp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 122,
      width: MediaQuery.sizeOf(context).width / 2.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
        color: Color(0xff545454),
        image: DecorationImage(
          image: AssetImage('assets/img/user.png'),
        ),
      ),
    );
  }
}
