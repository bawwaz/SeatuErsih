import 'package:flutter/material.dart';

class RegCleanListContainer extends StatelessWidget {
  final String shoename;
  final String add_ons;
  final String note;
  final Image logo;
  final int total_harga;

  const RegCleanListContainer({
    super.key,
    required this.shoename,
    required this.add_ons,
    required this.note,
    required this.total_harga,
    required this.logo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120, // Increased height to accommodate content better
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: logo,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    shoename,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Addons: $add_ons',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Note: $note',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2, 
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Total: \$${total_harga.toString()}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
