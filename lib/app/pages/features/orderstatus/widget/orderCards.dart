import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih/app/router/app_pages.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.STATUS_ORDER);
      },
      child: Container(
        height: 112,
        width: MediaQuery.sizeOf(context).width * 0.92,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  offset: Offset(0, 0),
                  blurRadius: 1.5,
                  spreadRadius: 0.5),
            ]),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 19.0, bottom: 10),
              child: Container(
                height: 76,
                width: 76,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: Offset(0, 0),
                          blurRadius: 1.5,
                          spreadRadius: 0.5),
                    ]),
                child: Image.asset(
                  'assets/img/Group 120.png',
                ),
              ),
            ),
            SizedBox(
              width: 14,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 9.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Regular Clean',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'x2',
                    style: TextStyle(
                      color: Color(0xFF626262),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    '50.000',
                    style: TextStyle(
                      color: Color(0xFF7EC1EB),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.2,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 35.5,
              ),
              child: Text(
                'Selesai',
              ),
            )
          ],
        ),
      ),
    );
  }
}
