import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih/app/pages/features/payment_confirmation_page/payment_confirmation_controller.dart';
import 'package:seatu_ersih/app/pages/features/payment_confirmation_page/widget/paymentweb_view.dart';
import 'package:seatu_ersih/app/router/app_pages.dart';

class PaymentConfirmationView extends GetView<PaymentConfirmationController> {
  const PaymentConfirmationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Image.asset('assets/img/angle-circle-right 1.png')),
        centerTitle: true,
        title: Text(
          'My Order',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              () => controller.isLoading.value && controller.orderData.isEmpty
                  ? CircularProgressIndicator()
                  : ListView.builder(
                      padding: EdgeInsets.all(20),
                      itemCount: controller.shoeData.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        Map<dynamic, dynamic> shoe = controller.shoeData[index];
                        return Container(
                          margin: EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 5,
                                offset: Offset(0, 0),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 180,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage('assets/img/icon-app.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 1,
                                    ),
                                    Text(
                                      "${shoe['brand']}",
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xFF8A8A8A),
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Container(
                                      width: Get.width * 0.45,
                                      child: Text(
                                        "Addons : ${shoe['addons']}",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.normal,
                                          color: Color(0xFF8A8A8A),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Container(
                                      width: Get.width * 0.45,
                                      child: Text(
                                        "Note : ${shoe['notes']}",
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.normal,
                                          color: Color(0xFF8A8A8A),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "${controller.formatPrice(int.parse(shoe['price'].toString()))}",
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.all(20),
                width: double.infinity,
                height: 1,
                decoration: BoxDecoration(
                  color: Color(0xFFD9D9D9),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Payment method",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Container(
                margin: EdgeInsets.all(20),
                width: double.infinity,
                height: 1,
                decoration: BoxDecoration(
                  color: Color(0xFFD9D9D9),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Biaya:",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  Obx(() {
                    final totalPrice = controller.orderData['total_price'];
                    return Text(
                      totalPrice == null
                          ? "Loading..."
                          : "${controller.formatPrice(totalPrice)}",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    );
                  }),
                ],
              ),
            ),
            SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Get.offAllNamed(Routes.CHECKOUT_ANIMATION);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF7EC1EB),
              padding: EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              'Place order',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future<bool> _handlePayment() async {
    bool paymentCreated = await controller.createPayment();
    if (paymentCreated && controller.checkoutLink != null) {
      Uri checkoutUri = Uri.parse(controller.checkoutLink!);
      await controller.proceedToPayment(checkoutUri);
    }
    return paymentCreated;
  }
}
