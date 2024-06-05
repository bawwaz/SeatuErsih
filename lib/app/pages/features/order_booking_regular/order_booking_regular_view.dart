import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih/app/pages/features/order_booking_regular/order_booking_regular_controller.dart';
import 'package:seatu_ersih/app/pages/features/order_booking_regular/widget/add_ons.dart';
import 'package:seatu_ersih/app/pages/features/order_booking_regular/widget/address.dart';
import 'package:seatu_ersih/app/pages/features/order_booking_regular/widget/button_next.dart';
import 'package:seatu_ersih/app/pages/features/order_booking_regular/widget/choice_shoes.dart';
import 'package:seatu_ersih/app/pages/features/order_booking_regular/widget/input_item_pickup.dart';
import 'package:seatu_ersih/app/pages/features/order_booking_regular/widget/input_note.dart';
import 'package:seatu_ersih/app/pages/features/order_booking_regular/widget/textfield_input_sepatu.dart';
import 'package:seatu_ersih/app/router/app_pages.dart';


class OrderBookingRegularView extends StatelessWidget {
  const OrderBookingRegularView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderBookingRegularController());
    final datePickerController = Get.put(());

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
                child: InkWell(
                  onTap: () {
                    Get.toNamed(Routes.BTMNAVBAR);
                  },
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
                              SizedBox(height: 7),
                              TextfieldInputSepatu(
                                controller: controller.textShoesControlller,
                                onTap: () {
                                  controller.addShoesLocally();
                                },
                              ),
                              SizedBox(height: 15),
                              Obx(() => controller.shoes.isEmpty
                                  ? Center(
                                      child: Text(
                                        "Tambah Sepatu",
                                        style: GoogleFonts.poppins(
                                          color: Color(0xFF000000),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    )
                                  : Container(
                                      width: 200,
                                      height: 30,
                                      margin: EdgeInsets.only(left: 27),
                                      child: ListView.builder(
                                        itemCount: controller.shoes.length,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          Map<String, dynamic> shoe =
                                              controller.shoes[index];
                                          return InkWell(
                                            onTap: () => controller.shoes
                                                .removeAt(index),
                                            child: ChoiceSepatu(
                                              name: shoe['name'],
                                            ),
                                          );
                                        },
                                      ),
                                    )),
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
                              // ItemPickup(
                                
                              // ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 27, top: 11),
                              ),
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
                              InputNote(onchanged: (value) {
                                controller.notes.value = value!;
                              }),
                              Address(),
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
