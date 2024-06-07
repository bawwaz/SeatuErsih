import 'package:flutter/material.dart';

class ProfileWidgetContainer extends StatelessWidget {
  final IconData icon;
  final String title;
  final IconData arrowIcon;
  final Color? color;

  const ProfileWidgetContainer({
    super.key,
    required this.icon,
    required this.title,
    required this.arrowIcon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 5,
            offset: Offset(0, 0),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: color ?? Colors.black),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(fontSize: 16, color: color ?? Colors.black),
              ),
            ],
          ),
          Icon(arrowIcon, color: color ?? Colors.black),
        ],
      ),
    );
  }
}
