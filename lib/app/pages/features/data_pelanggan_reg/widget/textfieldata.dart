import 'package:flutter/material.dart';
import 'package:seatu_ersih/themes/theme.dart';

class TextFieldData extends StatelessWidget {
  final String hintText;
  final Function(String)? onChanged;
  final String? initialValue;
  final bool readOnly;
  final TextAlign textAlign;

  const TextFieldData({
    Key? key,
    this.hintText = '',
    this.onChanged,
    this.initialValue,
    this.readOnly = false,
    this.textAlign = TextAlign.left,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: TextField(
        readOnly: readOnly,
        controller: TextEditingController(text: initialValue),
        onChanged: onChanged,
        textAlign: textAlign,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: tsBodyMediumMedium(darkGrey),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(left: 15),
        ),
      ),
    );
  }
}
