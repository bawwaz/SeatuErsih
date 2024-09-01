import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/profile_page_edit/profile_edit_controller.dart';
import 'package:seatu_ersih/app/pages/features/profile_page_edit/widget/profile_edit_texfield.dart';
import 'package:seatu_ersih/app/router/app_pages.dart';
import 'package:seatu_ersih/themes/colors.dart';
import 'package:seatu_ersih/themes/fonts.dart';
import 'package:seatu_ersih/themes/theme.dart';

class ProfileEditView extends GetView<ProfileEditController> {
  const ProfileEditView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Image.asset('assets/img/angle-circle-right 1.png')),
        title: Text(
          'Edit Profile',
          style: Fonts.header1.copyWith(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 17.0),
        child: Container(
          margin: EdgeInsets.only(left: 28, right: 28),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Obx(
                  () => controller.users['profile_picture'] != null
                      ? CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                              'http://seatuersih.pradiptaahmad.tech/image/${controller.users['profile_picture']}'),
                        )
                      : controller.image.value == null
                          ? CircleAvatar(
                              radius: 60,
                              backgroundImage:
                                  AssetImage('assets/img/profile-icon.png'),
                            )
                          : CircleAvatar(
                              radius: 60,
                              backgroundImage:
                                  FileImage(controller.image.value!),
                            ),
                ),
                SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: controller.pickImage,
                  child: Container(
                    height: 35,
                    width: MediaQuery.sizeOf(context).width * 0.3,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Edit Picture',
                        style: Fonts.detailBold.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Nama',
                    style: Fonts.header1
                        .copyWith(color: Colors.black, fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: ProfileEditTextField(
                    hintText: "Nama",
                    controller: controller.textNamaController,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      'Email',
                      style: Fonts.header1
                          .copyWith(color: Colors.black, fontSize: 15),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: ProfileEditTextField(
                    hintText: 'Email',
                    controller: controller.textEmailController,
                  ),
                ),
                SizedBox(
                  height: 150,
                ),
                GestureDetector(
                  onTap: () async {
                    await controller.updateUsers();
                  },
                  child: Container(
                    width: double.infinity,
                    height: 55,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Submit",
                      style: tsBodyMediumSemibold(Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
