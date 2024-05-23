import 'package:flutter/material.dart';

class InputPasswordRegist extends StatelessWidget {
  final Function(String)? onChanged;
  const InputPasswordRegist({Key? key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
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
