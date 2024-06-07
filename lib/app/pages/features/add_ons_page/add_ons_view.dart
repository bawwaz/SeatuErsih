import 'package:flutter/material.dart';
import 'package:seatu_ersih/themes/fonts.dart';

class AddOnsView extends StatelessWidget {
  const AddOnsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add Ons',
          style: Fonts.header1.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
