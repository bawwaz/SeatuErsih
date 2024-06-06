import 'package:flutter/material.dart';
import 'package:seatu_ersih/themes/colors.dart';
import 'package:seatu_ersih/themes/theme.dart';

class AuthTextField extends StatelessWidget {
  final Key? formKey;
  final String? hintText;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final bool? obsecureText;
  final Widget? prefixIcon;

  AuthTextField({
    Key? key,
    this.hintText,
    this.prefixIcon,
    this.formKey,
    this.validator,
    this.onChanged,
    this.obsecureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: TextFormField(
        onChanged: onChanged,
        validator: validator,
        obscureText: obsecureText ?? false,
        decoration: InputDecoration(
            isDense: true,
            isCollapsed: true,
            constraints: BoxConstraints(minWidth: double.infinity),
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2),
              borderRadius: BorderRadius.circular(20),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(20),
            ),
            // errorBorder: OutlineInputBorder(
            //   borderSide: BorderSide(color: Colors.red, width: 2),
            //   borderRadius: BorderRadius.circular(20),
            // ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor, width: 2),
              borderRadius: BorderRadius.circular(20),
            ),
            prefixIcon: prefixIcon,
            filled: true,
            fillColor: AppColors.lightGrey,
            hintText: hintText,
            hintStyle: tsBodyMediumMedium(darkGrey)),
      ),
    );
  }
}
