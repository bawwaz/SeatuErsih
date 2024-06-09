import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih/app/pages/features/profile_page/widget/profile_widget.dart';
import 'package:seatu_ersih/app/router/app_pages.dart';
import 'package:seatu_ersih/themes/fonts.dart';
import 'package:seatu_ersih/themes/theme.dart';
import 'profileController.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.only(left: 28, right: 28),
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 36.0),
                    child: Obx(
                      () => controller.users['profile_picture'] != null
                          ? CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(
                                  'http://seatuersih.pradiptaahmad.tech/image/${controller.users['profile_picture']}'),
                            )
                          : CircleAvatar(
                              radius: 60,
                              backgroundImage:
                                  AssetImage('assets/img/profile-icon.png'),
                            ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 36.0, left: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => Text(
                          controller.isLoading.value
                              ? "Loading..."
                              : controller.users['username'],
                          style: Fonts.header1
                              .copyWith(color: Colors.black, fontSize: 16),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Obx(
                            () => Text(
                              controller.isLoading.value
                                  ? "Loading..."
                                  : controller.users['email'],
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Obx(
                            () => Text(
                              controller.isLoading.value
                                  ? "Loading..."
                                  : controller.users['phone'],
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 36),
            InkWell(
              onTap: () async {
                await Get.toNamed(Routes.PROFILE_EDIT,
                        arguments: [controller.users.value])!
                    .then((value) {
                  controller.fetchUser();
                });
                
              },
              child: ProfileWidgetContainer(
                icon: Icons.edit,
                title: 'Edit Profile',
                arrowIcon: Icons.arrow_forward_ios_rounded,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 17.0),
              child: ProfileWidgetContainer(
                  icon: Icons.notifications,
                  title: 'Notification',
                  arrowIcon: Icons.arrow_forward_ios_rounded),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 17.0),
              child: ProfileWidgetContainer(
                icon: Icons.logout,
                title: 'Logout',
                arrowIcon: Icons.circle,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}


 // backgroundColor: Colors.white,
      // body: Container(
      //   margin: EdgeInsets.all(28),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.only(top: 34),
      //         child: InkWell(
      //           onTap: () {
      //             Get.toNamed(Routes.BTMNAVBAR);
      //           },
      //           child: Image.asset("assets/img/angle-circle-right 1.png"),
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.only(top: 32),
      //         child: Center(child: Image.asset("assets/img/profile-icon.png")),
      //       ),
      //       SizedBox(height: 9),
      //       Center(
      //         child: Obx(() => Text(
      //               controller.username.value,
      //               style: GoogleFonts.poppins(
      //                 color: Color(0xFF000000),
      //                 fontWeight: FontWeight.bold,
      //                 fontSize: 16,
      //               ),
      //             )),
      //       ),
      //       SizedBox(height: 25),
      //       Container(
      //         width: double.infinity,
      //         padding: EdgeInsets.all(15),
      //         alignment: Alignment.topLeft,
      //         decoration: BoxDecoration(
      //             color: Colors.white,
      //             boxShadow: [
      //               BoxShadow(
      //                 color: Colors.grey.withOpacity(0.5),
      //                 spreadRadius: 1,
      //                 blurRadius: 5,
      //                 offset: Offset(0, 3),
      //               ),
      //             ],
      //             borderRadius: BorderRadius.circular(10)),
      //         child: Obx(() => Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Text(
      //                   "Nama Pengguna",
      //                   style: tsBodyMediumMedium(Colors.black),
      //                 ),
      //                 Text(
      //                   controller.isLoading.value
      //                       ? "Loading..."
      //                       : controller.users['username'],
      //                   style: tsBodyMediumMedium(darkGrey),
      //                 ),
      //                 SizedBox(
      //                   height: 10,
      //                 ),
      //                 Text(
      //                   "Email",
      //                   style: tsBodyMediumMedium(Colors.black),
      //                 ),
      //                 Text(
      //                   controller.isLoading.value
      //                       ? "Loading..."
      //                       : controller.users['email'],
      //                   style: tsBodyMediumMedium(darkGrey),
      //                 ),
      //                 SizedBox(
      //                   height: 10,
      //                 ),
      //                 Text(
      //                   "Nomor Telepon",
      //                   style: tsBodyMediumMedium(Colors.black),
      //                 ),
      //                 Text(
      //                   controller.isLoading.value
      //                       ? "Loading..."
      //                       : controller.users['phone'],
      //                   style: tsBodyMediumMedium(darkGrey),
      //                 ),
      //               ],
      //             )),
      //       ),
      //       SizedBox(
      //         height: 15,
      //       ),
      //       GestureDetector(
      //         child: Container(
      //           height: 55,
      //           width: double.infinity,
      //           alignment: Alignment.center,
      //           decoration: BoxDecoration(
      //             color: Colors.red,
      //             borderRadius: BorderRadius.circular(10),
      //           ),
      //           child: Text(
      //             "Logout",
      //             style: tsBodyMediumBold(Colors.white),
      //           ),
      //         ),
      //       )
      //     ],
      //   ),
      // ),