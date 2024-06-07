import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class UserInfoRow extends GetView {
  const UserInfoRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/img/user.png'),
        Column(
          children: [
            Obx(
              () => Text(
                controller.username.value,
                style: GoogleFonts.poppins(
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Row(
              children: [
                Obx(
                  () => Text(
                    controller.users['email'],
                  ),
                ),
                Obx(
                  () => Text(controller.users['phone']),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
