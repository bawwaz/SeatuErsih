import 'package:flutter/material.dart';
import 'package:seatu_ersih/themes/colors.dart';

class TextfieldInputSepatu extends StatelessWidget {
  const TextfieldInputSepatu({
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
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 350,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                );
              },
            );
          },
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
