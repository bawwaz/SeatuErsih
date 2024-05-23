
import 'package:flutter/material.dart';
import 'package:seatu_ersih/controller/loginController.dart';

class InputUsername extends StatelessWidget {
  final LoginPageController controller;
  const InputUsername({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        controller.username.value;
      },
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
