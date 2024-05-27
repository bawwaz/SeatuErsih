import 'package:flutter/material.dart';

class InputUsername extends StatelessWidget {
  final ValueChanged<String> onChanged;

  InputUsername({required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Email',
      ),
    );
  }
}
