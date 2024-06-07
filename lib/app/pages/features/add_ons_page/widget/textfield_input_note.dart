import 'package:flutter/material.dart';

class InputCatatan extends StatelessWidget {
  const InputCatatan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 5,
      decoration: InputDecoration(
        hintText: 'Berikan arahan untuk membersihkan sepatu',
        border: InputBorder.none,
        contentPadding: EdgeInsets.all(20),
      ),
    );
  }
}