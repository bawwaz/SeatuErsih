import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardReview extends StatelessWidget {
  const CardReview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Regular Clean',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Image.asset(
                    "assets/img/Group 120.png",
                    width: 60,
                    height: 60,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Row(
                            children:
                                List.generate(5, (index) {
                              return Icon(
                                Icons.star,
                                color: Color(0xffFFCE31),
                                size: 22,
                              );
                            }),
                          ),
                          SizedBox(width: 5),
                          Text(
                            '• 04 Juli 2024',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff8A8A8A),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Note: terimakasih, sangat bersih',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff8A8A8A),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Rp50.000',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Color(0xFF7EC1EB),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: Image.asset(
            "assets/img/profile-icon.png",
            width: 27,
            height: 27,
          ),
        ),
      ],
    );
  }
}
