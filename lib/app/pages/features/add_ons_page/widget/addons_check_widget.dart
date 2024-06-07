  import 'package:flutter/material.dart';

  class AddOnsCheckWidget extends StatelessWidget {
    const AddOnsCheckWidget({super.key});

    @override
    Widget build(BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black),
        ),
        width: 24,
        height: 24,
      );
    }
  }
