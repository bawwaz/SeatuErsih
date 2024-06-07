import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/profile_page_edit/widget/profile_edit_texfield.dart';
import 'package:seatu_ersih/app/router/app_pages.dart';
import 'package:seatu_ersih/themes/colors.dart';
import 'package:seatu_ersih/themes/fonts.dart';

class ProfileEditView extends StatelessWidget {
  const ProfileEditView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Get.toNamed(Routes.PROFILE);
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
          child: Column(
            children: [
              Image.asset('assets/img/profile-icon.png'),
              SizedBox(
                height: 16,
              ),
              Container(
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
              SizedBox(
                height: 32,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Nama',
                  style:
                      Fonts.header1.copyWith(color: Colors.black, fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: ProfileEditTextField(hintText: 'value.username'),
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
                child: ProfileEditTextField(hintText: 'value.Email'),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    'Nomore Telepon',
                    style: Fonts.header1
                        .copyWith(color: Colors.black, fontSize: 15),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: ProfileEditTextField(hintText: 'value.Telepon'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
