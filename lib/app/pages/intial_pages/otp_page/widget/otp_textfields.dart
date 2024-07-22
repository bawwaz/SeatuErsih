import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seatu_ersih/themes/theme.dart';

class OtpTextfields extends StatelessWidget {
  const OtpTextfields({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey)),
          child: SizedBox(
            height: 45,
            width: MediaQuery.sizeOf(context).width / 7,
            child: TextField(
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              style: Theme.of(context).textTheme.headlineLarge,
              decoration: InputDecoration(
                border: InputBorder.none, // Remove default border
                enabledBorder: InputBorder.none, // Remove enabled border
                focusedBorder: InputBorder.none, // Remove focused border
              ),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey)),
          child: SizedBox(
            height: 45,
            width: MediaQuery.sizeOf(context).width / 7,
            child: TextField(
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              style: Theme.of(context).textTheme.headlineLarge,
              decoration: InputDecoration(
                border: InputBorder.none, // Remove default border
                enabledBorder: InputBorder.none, // Remove enabled border
                focusedBorder: InputBorder.none, // Remove focused border
              ),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey)),
          child: SizedBox(
            height: 45,
            width: MediaQuery.sizeOf(context).width / 7,
            child: TextField(
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              style: Theme.of(context).textTheme.headlineLarge,
              decoration: InputDecoration(
                border: InputBorder.none, // Remove default border
                enabledBorder: InputBorder.none, // Remove enabled border
                focusedBorder: InputBorder.none, // Remove focused border
              ),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey)),
          child: SizedBox(
            height: 45,
            width: MediaQuery.sizeOf(context).width / 7,
            child: TextField(
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              style: Theme.of(context).textTheme.headlineLarge,
              decoration: InputDecoration(
                border: InputBorder.none, // Remove default border
                enabledBorder: InputBorder.none, // Remove enabled border
                focusedBorder: InputBorder.none, // Remove focused border
              ),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey)),
          child: SizedBox(
            height: 45,
            width: MediaQuery.sizeOf(context).width / 7,
            child: TextField(
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              style: Theme.of(context).textTheme.headlineLarge,
              decoration: InputDecoration(
                border: InputBorder.none, // Remove default border
                enabledBorder: InputBorder.none, // Remove enabled border
                focusedBorder: InputBorder.none, // Remove focused border
              ),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey)),
          child: SizedBox(
            height: 45,
            width: MediaQuery.sizeOf(context).width / 7,
            child: TextField(
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              style: Theme.of(context).textTheme.headlineLarge,
              decoration: InputDecoration(
                border: InputBorder.none, // Remove default border
                enabledBorder: InputBorder.none, // Remove enabled border
                focusedBorder: InputBorder.none, // Remove focused border
              ),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
