import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih/themes/colors.dart';
import 'package:seatu_ersih/app/pages/features/order_detail/widget/order_detailAsset.dart';
import 'package:seatu_ersih/app/pages/features/order_detail/widget/order_detailTextDesc.dart';

class DetailBody extends StatefulWidget {
  const DetailBody({super.key});

  @override
  _DetailBodyState createState() => _DetailBodyState();
}

class _DetailBodyState extends State<DetailBody> {
  bool _isExpanded = false;

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(height: 10),
            Container(
              height: 163,
              width: 163,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff000000),
                    blurRadius: 0.5,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Center(
                child: Image.asset(
                  'assets/img/Group 120.png',
                ),
              ),
            ),
            SizedBox(height: 28),
            Desc(),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 61.0),
              child: assetOrderDetail(),
            ),
          ],
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: GestureDetector(
            onTap: _toggleExpansion,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: _isExpanded ? 250 : 90, // Adjust height as needed
                color: AppColors.primaryColor,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      _isExpanded
                          ? Icons.arrow_downward_rounded
                          : Icons.arrow_upward_rounded,
                      size: 30.0,
                      color: Colors.white,
                    ),
                    Text(
                      'Order Detail',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    if (_isExpanded)
                      Expanded(
                        child: Center(
                          child: Text(
                            'Additional details go here',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
