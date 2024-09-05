import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih/themes/theme.dart'; // Assuming tsBodyMediumMedium and darkGrey are defined in your theme file

class TextFieldData extends StatelessWidget {
  final String hintText;
  final Function(String)? onChanged;
  final String? initialValue;
  final bool readOnly;
  final EdgeInsets? padding;
  final TextAlign textAlign;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const TextFieldData({
    Key? key,
    this.hintText = '',
    this.onChanged,
    this.initialValue,
    this.readOnly = false,
    this.textAlign = TextAlign.left,
    this.padding = const EdgeInsets.only(left: 15),
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3), // Provides a slight elevation effect
          ),
        ],
      ),
      child: TextField(
        readOnly: readOnly,
        controller: TextEditingController(text: initialValue),
        onChanged: onChanged,
        textAlign: textAlign,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        style: GoogleFonts.poppins(
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.w500, // Medium weight for the input text
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: tsBodyMediumMedium(darkGrey),
          border: InputBorder.none, // Removes the default border
          contentPadding: padding,
        ),
      ),
    );
  }
}
