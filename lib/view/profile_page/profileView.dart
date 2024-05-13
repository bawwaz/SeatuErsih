import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih/routes/routes.dart';
import 'package:seatu_ersih/widget/Profile/profilebody.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: InkWell(
          onTap: () {
            Get.toNamed(Routes.home);
          },
          child: Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/angle-circle-right 1.png'),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: profilebody(),
    );
  }
}
