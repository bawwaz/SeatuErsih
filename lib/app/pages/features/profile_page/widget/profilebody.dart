import 'package:flutter/material.dart';
import 'package:seatu_ersih/app/pages/features/profile_page/widget/profileicon.dart';
import 'profileAlamat.dart';

class profilebody extends StatelessWidget {
  const profilebody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: pfp(),
        ),
        alamat()
      ],
    );
  }
}
