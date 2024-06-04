import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih/app/pages/features/order_booking_regular/order_booking_regular_controller.dart';

class AddOns extends StatelessWidget {
  const AddOns({
    super.key,
    required this.controller,
  });

  final OrderBookingRegularController controller;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      removeLeft: true,
      removeRight: true,
      child: ListView.builder(
        itemCount: 4,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.only(top: 5, left: 27),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => GestureDetector(
                    onTap: () => controller.checkedkotoll[index].toggle(),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Color(0xFFC1C1C1)),
                          borderRadius: BorderRadius.circular(5),
                          color: controller.checkedkotoll[index].value
                              ? Color(0xFF7EC1EB)
                              : Colors.transparent),
                      child: controller.checkedkotoll[index].value
                          ? Icon(
                              Icons.check,
                              size: 15,
                              color: Colors.white,
                            )
                          : SizedBox(
                              height: 15,
                              width: 15,
                            ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 8),
                  child: Text(
                    "Jahit Sepatu - 20k",
                    style: GoogleFonts.poppins(
                      color: Color(0xFF1F1F1F),
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
