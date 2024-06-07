import 'package:flutter/material.dart';
import 'package:seatu_ersih/app/pages/features/profile_page/widget/user_info_row.dart';
import 'package:seatu_ersih/themes/fonts.dart';

class ProfilePageView extends StatelessWidget {
  const ProfilePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Profile', style: Fonts.header1),
        centerTitle: true,
      ),
      body: Column(
        children: [UserInfoRow(),],
      ),
    );
  }
}
