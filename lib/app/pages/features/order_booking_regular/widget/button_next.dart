import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih/app/router/app_pages.dart';

class ButtonNext extends StatelessWidget {
  const ButtonNext({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Align(
        alignment: Alignment.centerRight,
        child: InkWell(
          onTap: () {
            
            Get.toNamed(Routes.CHECKOUT);
          },
          child: Container(
            width: 68,
            height: 29,
            decoration: BoxDecoration(
              color: Color(0xFF7EC1EB),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Icon(
                Icons.east,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
