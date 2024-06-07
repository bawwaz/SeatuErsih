import 'package:flutter/material.dart';
import 'package:seatu_ersih/themes/colors.dart';
import 'package:seatu_ersih/themes/fonts.dart';

class OrderContainer extends StatelessWidget {
  const OrderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 1.2,
              spreadRadius: 0,
              offset: Offset(0, 0),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(
                  8.0), // Add some padding around the image
              child: Image.asset('assets/img/Group 120.png'),
            ),
            Expanded(
              // Use Expanded to take up remaining space
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 8.0), // Add some left padding to the column
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Align items to the start
                  mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly, // Distribute space evenly
                  children: [
                    Row(
                      children: [
                        Text(
                          'Deep Clean',
                          style: Fonts.desc.copyWith(
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            'x2',
                            style: Fonts.detail.copyWith(
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '02/06/24',
                      style: Fonts.desc.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      '50000',
                      style: Fonts.detail.copyWith(
                        fontSize: 15,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
