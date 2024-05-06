import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:seatu_ersih/themes/colors.dart';
import 'package:seatu_ersih/themes/fonts.dart';
import 'package:seatu_ersih/widget/Homepage/Banner.dart';
import 'package:seatu_ersih/widget/Homepage/ProductsContainer.dart';
import 'Homepagebtm.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(children: [
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: AppColors.primaryColor),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 27.0, top: 13),
            child: Column(
              children: [
                Text(
                  'Sepatu Resik',
                  style: Fonts.slogan,
                ),
                Text(
                  'dadine Apik!',
                  style: Fonts.slogan,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 92.0),
            child: Center(
              child: Stack(children: [
                banner(),
              ]),
            ),
          )
        ]),
        Center(
          child: Column(
            children: [
              Products(),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.1,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Homebtm(),
        )
      ],
    );
  }
}
