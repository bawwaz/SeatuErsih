import 'package:flutter/material.dart';

class ItemPickup extends StatelessWidget {
  final TextEditingController dateController;
  final Future<void> Function(BuildContext) selectDate;

  const ItemPickup({
    super.key,
    required this.dateController,
    required this.selectDate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 27, top: 10),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              selectDate(context);
            },
            child: Icon(
              Icons.calendar_month,
              color: Color(0xFF7EC1EB),
            ),
          ),
          SizedBox(
            width: 9,
          ),
          SizedBox(
            width: 110,
            height: 35,
            child: TextField(
              controller: dateController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 5, left: 5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
