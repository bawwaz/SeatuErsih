import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:seatu_ersih/themes/colors.dart';
import 'package:seatu_ersih/themes/fonts.dart';
import 'package:seatu_ersih/widget/Homepage/Banner.dart';
import 'package:seatu_ersih/widget/Homepage/ProductsContainer.dart';
import 'Homepagebtm.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(children: [
          Container(
            height: 200,
            width: double.infinity,
            color: AppColors.primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sepatu Resik',
                  style: Fonts.slogan,
                ),
                Text(
                  'dadine Apik!',
                  style: Fonts.slogan,
                ),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 100, left: 19.5),
              child: banner(),
            ),
          ),
        ]),
        SizedBox(
          height: 30,
        ),
        Products()
      ],
    );
  }
}
