import 'package:flutter/material.dart';

class InputUsername extends StatelessWidget {
  const InputUsername({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        labelText: "Name",
        prefixIcon: Icon(
          Icons.person,
          color: Color(0xFF8A8A8A),
        ),
        labelStyle: TextStyle(
          // color: Color(0xFF8A8A8A),
        ),
      ),
      style: TextStyle(),
    );
  }
}
