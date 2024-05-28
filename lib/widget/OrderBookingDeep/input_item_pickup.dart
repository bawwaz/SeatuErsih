import 'package:flutter/material.dart';

class ItemPickup extends StatelessWidget {
  const ItemPickup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 27, top: 10),
      child: Row(
        children: [
          Icon(
            Icons.calendar_month,
            color: Color(0xFF7EC1EB),
          ),
          SizedBox(
            width: 9,
          ),
          SizedBox(
            width: 110,
            height: 35,
            child: TextField(
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
