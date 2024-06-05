import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'profileInfoController.dart';

class profileinfo extends StatelessWidget {
  const profileinfo ({super.key});

  @override
  Widget build(BuildContext context) {
    final profileInfoController controller = Get.put(profileInfoController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: GoogleFonts.poppins()),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: controller.logout,
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Username: ${controller.username.value}', style: GoogleFonts.poppins(fontSize: 18)),
              SizedBox(height: 10),
              Text('Email: ${controller.email.value}', style: GoogleFonts.poppins(fontSize: 18)),
              SizedBox(height: 10),
              Text('Phone: ${controller.phone.value}', style: GoogleFonts.poppins(fontSize: 18)),
            ],
          ),
        );
      }),
    );
  }
}
