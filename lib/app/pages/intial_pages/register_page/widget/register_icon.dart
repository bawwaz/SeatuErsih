import 'package:flutter/material.dart';

class LogoProductRegist extends StatelessWidget {
  const LogoProductRegist({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Image.asset("assets/img/icon-app.png"),
    );
  }
}
