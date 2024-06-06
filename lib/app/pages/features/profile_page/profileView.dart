import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih/app/router/app_pages.dart';
import 'package:seatu_ersih/themes/theme.dart';
import 'profileController.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 34),
              child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.BTMNAVBAR);
                },
                child: Image.asset("assets/img/angle-circle-right 1.png"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: Center(child: Image.asset("assets/img/profile-icon.png")),
            ),
            SizedBox(height: 9),
            Center(
              child: Obx(() => Text(
                    controller.username.value,
                    style: GoogleFonts.poppins(
                      color: Color(0xFF000000),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  )),
            ),
            SizedBox(height: 25),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(15),
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10)),
              child: Obx(() => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nama Pengguna",
                        style: tsBodyMediumMedium(Colors.black),
                      ),
                      Text(
                        controller.isLoading.value
                            ? "Loading..."
                            : controller.users['username'],
                        style: tsBodyMediumMedium(darkGrey),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Email",
                        style: tsBodyMediumMedium(Colors.black),
                      ),
                      Text(
                        controller.isLoading.value
                            ? "Loading..."
                            : controller.users['email'],
                        style: tsBodyMediumMedium(darkGrey),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Nomor Telepon",
                        style: tsBodyMediumMedium(Colors.black),
                      ),
                      Text(
                        controller.isLoading.value
                            ? "Loading..."
                            : controller.users['phone'],
                        style: tsBodyMediumMedium(darkGrey),
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: 15,
            ),
            GestureDetector(
              child: Container(
                height: 55,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Logout",
                  style: tsBodyMediumBold(Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
