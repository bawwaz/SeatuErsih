import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:seatu_ersih/themes/colors.dart';
import 'package:seatu_ersih/themes/fonts.dart';
import 'package:seatu_ersih/app/pages/features/Home_Page/widget/Banner.dart';
import 'package:seatu_ersih/app/pages/features/Home_Page/widget/ProductsContainer.dart';

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
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
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
            padding: const EdgeInsets.only(top: 150.0),
            child: Products(),
          ))
        ]),
        SizedBox(
          height: 50,
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: banner(),
          ),
        ),
      ],
    );
  }
}
