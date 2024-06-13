import 'package:flutter/material.dart';

class RegCleanListContainer extends StatelessWidget {
  final String shoename;
  final String add_ons;
  final String note;
  final Image logo;
  final int total_harga;

  const RegCleanListContainer(
      {super.key,
      required this.shoename,
      required this.add_ons,
      required this.note,
      required this.total_harga,
      required this.logo});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 89,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
            ),
          ]),
      child: Row(
        children: [
          logo,
          Expanded(
            child: Column(
              children: [
                Text(shoename),
                Text(
                  'Addons : $add_ons',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  'Note: $note',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text('$total_harga'),
              ],
            ),
          ),
          // Spacer(),
          // Icon(Icons.delete),
        ],
      ),
    );
  }
}
