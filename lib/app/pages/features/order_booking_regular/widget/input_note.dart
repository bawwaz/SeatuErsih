import 'package:flutter/material.dart';

class InputNote extends StatelessWidget {
  final void Function(String?)? onchanged;


    InputNote({
    this.onchanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, left: 27),
      child: SizedBox(
        width: 210,
        height: 105,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color(0xFFEEEEEE),
          ),
          child: TextField(
            style: TextStyle(fontSize: 12),
            maxLines: 5,
            onChanged: onchanged,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(8.0),
            ),
          ),
        ),
      ),
    );
  }
}
