import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/profile_page/widget/profile_widget.dart';
import 'package:seatu_ersih/app/router/app_pages.dart';
import 'package:seatu_ersih/themes/fonts.dart';
import 'profileController.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Memanggil fetchUser setiap kali widget dibangun
    controller.fetchUser();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 28, right: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                                'http://seatuersih.pradiptaahmad.tech/image/${controller.users['profile_picture']}',
                              ),
                            )
                          : CircleAvatar(
                              radius: 60,
                              backgroundImage:
                                  AssetImage('assets/img/profile-icon.png'),
                            ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 36.0, left: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                          () => Text(
                            controller.isLoading.value
                                ? "Loading..."
                                : controller.users['username'] ?? "No Username",
                            style: Fonts.header1
                                .copyWith(color: Colors.black, fontSize: 16),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Column(
                          children: [
                            Obx(
                              () => Text(
                                controller.isLoading.value
                                    ? "Loading..."
                                    : controller.users['email'] ?? "No Email",
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Obx(
                              () => Text(
                                controller.isLoading.value
                                    ? "Loading..."
                                    : controller.users['phone'] ?? "No Phone",
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
                          arguments: [controller.users])!
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
                child: InkWell(
                  onTap: () {
                    controller.logout();
                  },
                  child: ProfileWidgetContainer(
                    icon: Icons.logout,
                    title: 'Logout',
                    arrowIcon: Icons.circle,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
