// auth_textfield.dart

import 'package:flutter/material.dart';
import 'package:seatu_ersih/themes/colors.dart';
import 'package:seatu_ersih/themes/theme.dart';
import 'package:get/get.dart';

class AuthTextField extends StatelessWidget {
  final Key? formKey;
  final String? hintText;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final bool obsecureText;
  final Widget? prefixIcon;
  final Function()? toggleVisibility;
  final bool isPasswordHidden;

  AuthTextField({
    Key? key,
    this.hintText,
    this.prefixIcon,
    this.formKey,
    this.validator,
    this.onChanged,
    this.obsecureText = false,
    this.toggleVisibility,
    this.isPasswordHidden = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: TextFormField(
        onChanged: onChanged,
        validator: validator,
        obscureText: obsecureText && isPasswordHidden,
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
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor, width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
          prefixIcon: prefixIcon,
          suffixIcon: obsecureText
              ? IconButton(
                  icon: Icon(
                    isPasswordHidden ? Icons.visibility_off : Icons.visibility,
                    color: Color(0xFF8A8A8A),
                  ),
                  onPressed: toggleVisibility,
                )
              : null,
          filled: true,
          fillColor: AppColors.lightGrey,
          hintText: hintText,
          hintStyle: tsBodyMediumMedium(darkGrey),
        ),
      ),
    );
  }
}
