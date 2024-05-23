import 'package:flutter/material.dart';
import 'package:seatu_ersih/controller/loginController.dart';

class InputPassword extends StatelessWidget {
  final LoginPageController controller;
  const InputPassword({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        controller.password.value = value;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        labelText: "Password",
        prefixIcon: Icon(
          Icons.lock,
          color: Color(0xFF8A8A8A),
        ),
      ),
    );
  }
}
