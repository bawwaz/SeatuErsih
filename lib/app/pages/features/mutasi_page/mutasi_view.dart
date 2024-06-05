import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MutasiView extends StatelessWidget {
  const MutasiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(27),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Mutasi",
                style: GoogleFonts.poppins(
                  color: Color(0xFF7EC1EB),
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "TODAY",
              style: GoogleFonts.poppins(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/img/go-pay.png'),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "GOPAY",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "Regular Clean",
                        style: GoogleFonts.poppins(
                          color: Color(0xFF8A8A8A),
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "- IDR 25.000",
                  style: GoogleFonts.poppins(
                    color: Color(0xFFFF6363),
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 10),
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/img/dana-icon.png'),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "DANA",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "Deep Clean",
                        style: GoogleFonts.poppins(
                          color: Color(0xFF8A8A8A),
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "- IDR 35.000",
                  style: GoogleFonts.poppins(
                    color: Color(0xFFFF6363),
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(),
          ],
        ),
      ),
    );
  }
}
