import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Bannerstatus extends StatelessWidget {
  const Bannerstatus({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/img/shoesman.png',
                    width: 100,
                    height: 100,
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your shoes',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'is completed!',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            );
  }
}