import 'package:flutter/material.dart';

class LogoProduct extends StatelessWidget {
  const LogoProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Image.asset("assets/img/icon-app.png"),
    );
  }
}
