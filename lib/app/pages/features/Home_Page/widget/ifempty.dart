import 'package:flutter/material.dart';
import 'package:seatu_ersih/themes/fonts.dart';

class ImgIfEmpty extends StatelessWidget {
  const ImgIfEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 58.0),
      child: Column(
        children: [
          Image.asset('assets/img/box 1.png'),
          Text(
            'You havent ordered anything...',
            style: Fonts.desc,
            textAlign: TextAlign.center,
          ),
          Text(
            'there’s nothing to see here',
            style: Fonts.desc,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
