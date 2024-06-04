import 'package:flutter/material.dart';
import 'package:seatu_ersih/themes/fonts.dart';

class contact extends StatelessWidget {
  const contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'username',
          style: Fonts.header1,
        ), //take name from auth
        Text(
          'Number',
          style: Fonts.header2,
        ), //take number from auth
      ],
    );
  }
}
