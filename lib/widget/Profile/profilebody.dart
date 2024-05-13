import 'package:flutter/material.dart';
import 'package:seatu_ersih/widget/Profile/profileicon.dart';
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
