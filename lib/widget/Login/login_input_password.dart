import 'package:flutter/material.dart';

class InputPassword extends StatelessWidget {
  final ValueChanged<String> onChanged;

  InputPassword({required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Password',
      ),
    );
  }
}