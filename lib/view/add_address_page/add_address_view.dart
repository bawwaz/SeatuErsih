import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AddAddressView extends StatelessWidget {
  const AddAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(27),
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Image.asset("assets/img/angle-circle-right 1.png"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      width: 259,
                      height: 420,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 50, left: 27),
                              child: Text(
                                "Contact information",
                                style: GoogleFonts.poppins(
                                  color: Color(0xFF7EC1EB),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 27, top: 10),
                              child: SizedBox(
                                width: 209,
                                height: 34,
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                    hintText: "+62 8XX XXXX XXXX",
                                    hintStyle: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    contentPadding:
                                        EdgeInsets.only(bottom: 5, left: 10),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 27),
                              child: Text(
                                "Kota",
                                style: GoogleFonts.poppins(
                                  color: Color(0xFF7EC1EB),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 27, top: 10),
                              child: SizedBox(
                                width: 209,
                                height: 34,
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Isi disini",
                                    hintStyle: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    contentPadding:
                                        EdgeInsets.only(bottom: 5, left: 10),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 27),
                              child: Text(
                                "Lokasi Alamat",
                                style: GoogleFonts.poppins(
                                  color: Color(0xFF7EC1EB),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 27, top: 10),
                              child: SizedBox(
                                width: 209,
                                height: 34,
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Nama Jalan",
                                    hintStyle: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    contentPadding:
                                        EdgeInsets.only(bottom: 5, left: 10),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 27, top: 10),
                              child: SizedBox(
                                width: 209,
                                height: 55,
                                child: TextField(
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                    hintText: "Detail Lokasi",
                                    hintStyle: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    contentPadding:
                                        EdgeInsets.only(bottom: 5, left: 10),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 27),
                              child: Text(
                                "Nama Lokasi",
                                style: GoogleFonts.poppins(
                                  color: Color(0xFF7EC1EB),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 27, top: 10),
                              child: SizedBox(
                                width: 209,
                                height: 34,
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Rumah, Kantor, Apartment",
                                    hintStyle: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    contentPadding:
                                        EdgeInsets.only(bottom: 5, left: 10),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 8,
                      child: Text(
                        "Tambah Alamat",
                        style: GoogleFonts.poppins(
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    print("tes");
                  },
                  child: Container(
                    width: 210,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Color(0xFF7EC1EB),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        "Tambah Alamat",
                        style: GoogleFonts.poppins(
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
