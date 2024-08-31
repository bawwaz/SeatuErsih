import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih/app/pages/features/regular_shoe_list/regular_clean_list_controller.dart';
import 'package:seatu_ersih/app/router/app_pages.dart';
import 'package:seatu_ersih/themes/theme.dart';

class RegCleanListView extends StatelessWidget {
  final RegCleanListController controller = Get.put(RegCleanListController());

  RegCleanListView({super.key});

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
      body: Obx(
        () => controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : controller.shoes.isEmpty
                ? Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Image.asset(
                            'assets/img/no_item.png',
                            width: 200,
                            height: 200,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Tambah sepatu anda di bawah dan akan di tampilkan di sini',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.all(20),
                      itemCount: controller.shoes.length,
                      itemBuilder: (context, index) {
                        Map<dynamic, dynamic> shoe = controller.shoes[index];
                        String brandName = shoe['brand'] ?? 'No Brand';
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
                          height: 150,
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
                                SizedBox(width: 5),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      brandName,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Container(
                                      width: Get.width * 0.45,
                                      child: Text(
                                        "Addons: ${shoe['addons']}",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.normal,
                                          color: Color(0xFF8A8A8A),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Note: ${shoe['notes']}",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xFF8A8A8A),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      controller.formatPrice(
                                          int.parse(shoe['price'].toString())),
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                IconButton(
                                  onPressed: () {
                                    controller.deleteShoes(shoe['id']);
                                  },
                                  icon: Icon(Icons.delete),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                  color: primaryColor,
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
                Get.toNamed(Routes.PAYMENT_CONFIRMATION,
                    arguments: {'regList': controller.orderId})?.then((value) {
                  if (value == "success") {
                    controller.clearShoes();
                  }
                });
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
    );
  }
}
