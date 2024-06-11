import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih/app/pages/features/regular_shoe_list/regular_clean_list_controller.dart';
import 'package:seatu_ersih/app/router/app_pages.dart';

class RegCleanListView extends GetView<RegCleanListController> {
  const RegCleanListView({super.key});

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
          'Regular Clean',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        children: [
          Obx(
            () => controller.isLoading.value
                ? CircularProgressIndicator()
                : Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.all(20),
                      itemCount: controller.shoes.length,
                      itemBuilder: (context, index) {
                        Map<dynamic, dynamic> shoe = controller.shoes[index];
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
                          height: 130,
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
                                    Text(
                                      "${shoe['name']}",
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      "Addons : ${shoe['addons']}",
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xFF8A8A8A),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      "Note : ${shoe['notes']}",
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xFF8A8A8A),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      "Rp. ${controller.formatPrice(int.parse(shoe['price'].toString()))}",
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(Icons.delete)
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.ADD_ONS, arguments: ['regular_clean'])
                        ?.then((value) {
                      if (value == "success") {
                        controller.fetchShoes();
                      }
                    });
                  },
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xFFC6EAFF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Add Shoes',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.PAYMENT_CONFIRMATION);
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFF7EC1EB),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Checkout',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
