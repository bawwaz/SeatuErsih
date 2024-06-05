import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih/app/router/app_pages.dart';
import 'profileController.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

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
            SizedBox(height: 9),
            Center(
              child: Obx(() => Text(
                    controller.phoneNumber.value,
                    style: GoogleFonts.poppins(
                      color: Color(0xFF616161),
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  )),
            ),
            SizedBox(height: 58),
            Center(
              child: Container(
                width: 305,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Color(0xFF292929),
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.bookmark,
                        color: Color(0xFF7EC1EB),
                      ),
                      Obx(() => Text(
                            controller.phoneNumber.value,
                            style: GoogleFonts.poppins(
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          )),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Container(
                width: 305,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Color(0xFF292929),
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.info,
                        color: Color(0xFF7EC1EB),
                      ),
                      Text(
                        "Informasi",
                        style: GoogleFonts.poppins(
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: InkWell(
                onTap: () {
                  controller.logout();
                },
                child: Container(
                  width: 305,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Color(0xFF292929),
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "LOGOUT",
                      style: GoogleFonts.poppins(
                        color: Color(0xFFFF0000),
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}