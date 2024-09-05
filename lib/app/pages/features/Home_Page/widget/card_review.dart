import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CardReview extends StatelessWidget {
  final Map<String, dynamic> review;

  const CardReview({
    Key? key,
    required this.review,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double rating = double.tryParse(review['rating'] ?? '0') ?? 0.0;

    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                review['order_type'] ?? 'Regular Clean',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(''),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  formatDate(review['created_at']),
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff8A8A8A),
                  ),
                ),
              ),
            ],
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Row(
                        children: List.generate(5, (index) {
                          return Icon(
                            index < rating.floor()
                                ? Icons.star
                                : index < rating
                                    ? Icons.star_half
                                    : Icons.star_border,
                            color: Color(0xffFFCE31),
                            size: 22,
                          );
                        }),
                      ),
                      SizedBox(width: 5),
                      Text(
                        '${review['rating']}',
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
                    'Note: ${review['review'] ?? ''}',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff8A8A8A),
                    ),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  String formatDate(String date) {
    // Parse the date string assuming the input format is "yyyy-MM-ddTHH:mm:ss"
    DateTime dateTime = DateTime.parse(date);

    // Format the date to "4 September 2024"
    return DateFormat('d MMMM y').format(dateTime);
  }
}
