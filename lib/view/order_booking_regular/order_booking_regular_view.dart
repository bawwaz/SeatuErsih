import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih/view/order_booking_regular/order_booking_regular_controller.dart';
import 'package:seatu_ersih/widget/OrderBookingRegular/add_ons.dart';
import 'package:seatu_ersih/widget/OrderBookingRegular/address.dart';
import 'package:seatu_ersih/widget/OrderBookingRegular/button_next.dart';
import 'package:seatu_ersih/widget/OrderBookingRegular/choice_shoes.dart';
import 'package:seatu_ersih/widget/OrderBookingRegular/input_item_pickup.dart';
import 'package:seatu_ersih/widget/OrderBookingRegular/input_note.dart';
import 'package:seatu_ersih/widget/OrderBookingRegular/input_sepatu.dart';

class OrderBookingRegularView extends StatelessWidget {
  const OrderBookingRegularView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderBookingRegularController());
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Container(
        margin: EdgeInsets.all(27),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Image.asset("assets/img/angle-circle-right 1.png"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        width: 259,
                        height: 620,
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
                          padding: const EdgeInsets.only(top: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 27),
                                child: Text(
                                  "Sepatu",
                                  style: GoogleFonts.poppins(
                                    color: Color(0xFF000000),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              TextfieldInputSepatu(),
                              SizedBox(
                                height: 15,
                              ),
                              ChoiceSepatu(),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Container(
                                    width: 251,
                                    height: 1,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFD9D9D9),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 27, top: 11),
                                child: Text(
                                  "Tanggal Pengambilan",
                                  style: GoogleFonts.poppins(
                                    color: Color(0xFF000000),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              ItemPickup(),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 27, top: 11),
                                child: Text(
                                  "Add-Ons",
                                  style: GoogleFonts.poppins(
                                    color: Color(0xFF000000),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              AddOns(controller: controller),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Container(
                                    width: 251,
                                    height: 1,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFD9D9D9),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 27),
                                child: Text(
                                  "Note",
                                  style: GoogleFonts.poppins(
                                    color: Color(0xFF000000),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 2, left: 27),
                                child: Text(
                                  "(Ciri ciri sepatu anda dan instruksi laundry)",
                                  style: GoogleFonts.poppins(
                                    color: Color(0xFF6C6C6C),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 9,
                                  ),
                                ),
                              ),
                              InputNote(),
                              Address()
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 8,
                        child: Text(
                          "Regular Clean",
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
              ButtonNext(),
            ],
          ),
        ),
      ),
    );
  }
}
