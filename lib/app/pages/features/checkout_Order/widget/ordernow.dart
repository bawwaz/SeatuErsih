import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih/app/pages/features/checkout_Order/checkout_order_Controller.dart';
import 'package:seatu_ersih/app/router/app_pages.dart';

class ordernow extends GetView<CheckoutController> {
  const ordernow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 305,
      height: 114,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 23,
            child: Container(
              width: 305,
              height: 91,
              decoration: ShapeDecoration(
                color: Color(0xFF7EC1EB),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 305,
              height: 52,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 0.50, color: Color(0x7F8A8A8A)),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 55,
            child: Text(
              'Subtotal',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
          Positioned(
              left: 20,
              top: 79,
              child: Obx(() => Text(
                    'Rp ${controller.totalPrice}',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ))),
          Positioned(
            left: 162,
            top: 61,
            child: Container(
              width: 123,
              height: 38,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: InkWell(
                      onTap: () async {
                        controller.createOrder();
                      },
                      child: Container(
                        width: 123,
                        height: 38,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 14,
                    top: 11,
                    child: Obx(() => Text(
                          controller.isLoading.value
                              ? "Loading..."
                              : "Place Order",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        )),
                  ),
                  Positioned(
                    left: 90,
                    top: 8,
                    child: Container(
                      width: 21,
                      height: 12,
                      decoration: BoxDecoration(),
                      child: Icon(Icons.keyboard_arrow_right_rounded),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 19,
            child: Container(
              width: 265,
              height: 18,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: ShapeDecoration(
                        color: Color(0xFFFC5B5B),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 27,
                    top: 1,
                    child: Text(
                      'Select payment method',
                      style: TextStyle(
                        color: Color(0xFFFC5C5C),
                        fontSize: 10,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 7,
                    top: 1,
                    child: Text(
                      '!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 247,
                    top: 0,
                    child: Container(
                      width: 18,
                      height: 18,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 18,
                              height: 18,
                              decoration: ShapeDecoration(
                                color: Color(0xFF838383),
                                shape: OvalBorder(),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 2,
                            top: 7,
                            child: Container(
                              width: 4,
                              height: 4,
                              decoration: ShapeDecoration(
                                shape: OvalBorder(
                                  side:
                                      BorderSide(width: 1, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 7,
                            top: 7,
                            child: Container(
                              width: 4,
                              height: 4,
                              decoration: ShapeDecoration(
                                shape: OvalBorder(
                                  side:
                                      BorderSide(width: 1, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 12,
                            top: 7,
                            child: Container(
                              width: 4,
                              height: 4,
                              decoration: ShapeDecoration(
                                shape: OvalBorder(
                                  side:
                                      BorderSide(width: 1, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
