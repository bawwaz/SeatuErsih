import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih/app/pages/features/choose_service/choose_service_controller.dart';
import 'package:seatu_ersih/app/pages/features/choose_service/widget/choose_service_container.dart';
import 'package:seatu_ersih/app/router/app_pages.dart';

class ChooseService extends GetView<ChooseServiceController> {
  const ChooseService({super.key});

  @override
  Widget build(BuildContext context) {
    final ChooseServiceController controller =
        Get.put(ChooseServiceController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Get.toNamed(Routes.BTMNAVBAR);
          },
          child: Image.asset('assets/img/angle-circle-right 1.png'),
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: controller.refreshData,
        child: Obx(() {
          return ListView(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 16.0,
            ),
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Center(
                    child: Text(
                      'Jasa yang kami sediakan',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              controller.laundries.isEmpty
                  ? ListView.builder(
                      itemCount: 2,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return ServiceContainer(isLoading: true);
                      },
                    )
                  : ListView.builder(
                      itemCount: controller.laundries.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        double avgRating =
                            (index < controller.average_rating.length)
                                ? controller.average_rating[index]
                                : 0.0;

                        String productName =
                            controller.laundries[index]["name"];
                        String price = "N/A";

                        if (productName == "Regular Clean") {
                          price = "25k";
                        } else if (productName == "Deep Clean") {
                          price = "35k";
                        } else {
                          price = controller.laundries[index]["price"] ?? "N/A";
                        }

                        return ServiceContainer(
                          title: productName,
                          description: controller.laundries[index]
                              ["Description"],
                          price: price,
                          buttonText: "Pesan Sekarang",
                          icon: Icons.star_rounded,
                          avgRating: avgRating,
                          isStoreOpen: controller.isStoreOpen.value,
                          onPressed: () {
                            print("Button pressed");
                            if (controller.isStoreOpen.value) {
                              print("Navigating to order page");
                              if (productName == "Regular Clean") {
                                Get.toNamed(Routes.DATA_PELANGGAN_REG,
                                    arguments: controller.laundries[index]
                                        ["id"]);
                              } else {
                                Get.toNamed(Routes.DATA_PELANGGAN_DEEP,
                                    arguments: controller.laundries[index]
                                        ["id"]);
                              }
                            } else {
                              print("Store is closed, showing snackbar");
                              Get.snackbar(
                                'Store Closed',
                                'Sorry, the store is closed',
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.white,
                                colorText: Colors.black,
                                icon: Icon(Icons.info, color: Colors.blue),
                              );
                            }
                          },
                        );
                      },
                    ),
            ],
          );
        }),
      ),
    );
  }
}
