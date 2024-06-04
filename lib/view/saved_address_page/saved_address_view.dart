import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SavedAddressView extends StatelessWidget {
  const SavedAddressView({super.key});

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
                      height: 230,
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
                                "Alamat Yang Tersimpan",
                                style: GoogleFonts.poppins(
                                  color: Color(0xFF7EC1EB),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                padding: const EdgeInsets.only(
                                    left: 27, top: 10, right: 27),
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Container(
                                      width: 209,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Text(
                                            'Kost Mitra ${index + 1}',
                                            style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 8,
                      child: Text(
                        "Alamat",
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
