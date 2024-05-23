import 'package:flutter/material.dart';

class InputEmailRegist extends StatelessWidget {
  final Function(String)? onChanged;
  const InputEmailRegist({Key? key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        labelText: "Email",
        prefixIcon: Icon(
          Icons.email,
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
