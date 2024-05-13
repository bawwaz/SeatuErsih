import 'package:flutter/material.dart';

class banner extends StatelessWidget {
  const banner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/img/banner.png'),
          fit: BoxFit.fill, 
        ),
      ),
    );
  }
}
