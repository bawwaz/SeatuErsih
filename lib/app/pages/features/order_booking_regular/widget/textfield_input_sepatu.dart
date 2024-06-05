import 'package:flutter/material.dart';
import 'package:seatu_ersih/themes/colors.dart';

class TextfieldInputSepatu extends StatelessWidget {
  final String? TextSepatu;
  final Function()? onTap;
  final Function(String)? onChanged;
  final TextEditingController? controller;

    TextfieldInputSepatu({
    this.TextSepatu,
    this.onChanged,
    this.onTap,
    this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 170,
          height: 35,
          child: Padding(
            padding: const EdgeInsets.only(left: 27),
            child: TextField(
              onChanged: onChanged,
              controller: controller,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 5, left: 5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 9,
        ),
        InkWell(
          onTap: onTap,
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1.2,
                  blurRadius: 1,
                ),
              ],
            ),
            child: Icon(
              Icons.check,
              color: Colors.white,
              size: 18,
            ),
          ),
        ),
      ],
    );
  }
}
