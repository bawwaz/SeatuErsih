import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih/app/pages/features/choose_service/choose_service_controller.dart';
import 'package:seatu_ersih/app/pages/features/choose_service/widget/choose_service_container.dart';
import 'package:seatu_ersih/app/router/app_pages.dart';
import 'package:seatu_ersih/themes/fonts.dart';
import 'package:shimmer/shimmer.dart';

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          bottom: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 4.0,
                ),
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
            Obx(() {
              if (controller.laundries.isEmpty) {
                // Show shimmer loading if data is not yet fetched
                return ListView.builder(
                  itemCount: 2, // Placeholder count
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return ServiceContainer(
                      isLoading: true,
                    );
                  },
                );
              } else {
                return ListView.builder(
                  itemCount: controller.laundries.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    // Ensure average_rating has an entry for this index
                    double avgRating =
                        (index < controller.average_rating.length)
                            ? controller.average_rating[index]
                            : 0.0; // Default to 0.0 if no rating is available

                    // Determine the price based on the product name
                    String productName = controller.laundries[index]["name"];
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
                      description: controller.laundries[index]["Description"],
                      price: price,
                      buttonText: "Pesan Sekarang",
                      icon: Icons.star_rounded,
                      avgRating: avgRating,
                      onPressed: () {
                        if (productName == "Regular Clean") {
                          Get.toNamed(Routes.DATA_PELANGGAN_REG,
                              arguments: controller.laundries[index]["id"]);
                        } else {
                          Get.toNamed(Routes.DATA_PELANGGAN_DEEP,
                              arguments: controller.laundries[index]["id"]);
                        }
                      },
                    );
                  },
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
