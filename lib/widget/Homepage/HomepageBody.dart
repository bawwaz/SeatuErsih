import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:seatu_ersih/themes/colors.dart';
import 'package:seatu_ersih/themes/fonts.dart';
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
          Center(
            child: Stack(children: [
              Padding(
                padding: const EdgeInsets.only(top: 100.0, left: 27, right: 27),
                child: Container(
                  height: 170,
                  width: 306,
                  decoration: BoxDecoration(
                    color: AppColors.Darkblu,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 130.0, left: 52),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Special Promo',
                      style: Fonts.header1,
                    ),
                    SizedBox(
                        width:
                            10), // Adjust the width of the SizedBox as needed
                    Text(
                      'Cuci 2 Gratis 1 !!',
                      style: Fonts.header2,
                    )
                  ],
                ),
              )
            ]),
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
