import 'package:flutter/material.dart';

class BannerSlogan extends StatelessWidget {
  const BannerSlogan({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 71,
      width: MediaQuery.sizeOf(context).width * 0.9,
      child: Center(
          child: Image.asset(
        'assets/img/bannerslogan.png',
        fit: BoxFit.cover,
      )),
    );
  }
}
