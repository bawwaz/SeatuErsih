import 'package:flutter/material.dart';
import 'package:seatu_ersih/themes/fonts.dart';

class Desc extends StatelessWidget {
  const Desc({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Driver lagi di jalan !',
          style: Fonts.header1blu,
        ),
        SizedBox(height: 10,),
        Text(
          'driver sedang menuju ketempat yang disetujui',
          style: Fonts.detail,
        ),
        
      ],
    );
  }
}
