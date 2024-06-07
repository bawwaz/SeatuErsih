import 'package:flutter/material.dart';


class InputNamaSepatu extends StatelessWidget {
  const InputNamaSepatu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Masukkan nama sepatu',
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        contentPadding:
            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      ),
    );
  }
}