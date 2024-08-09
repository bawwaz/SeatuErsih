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
        title: Text(
          'Pilih Jasa',
          style: Fonts.header1.copyWith(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 4.0),
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
              SizedBox(height: 20),
              Obx(() {
                if (controller.laundries.isEmpty) {
                  // Show shimmer loading if data is not yet fetched
                  return ListView.builder(
                    itemCount: 5, // Placeholder count
                    shrinkWrap: true,
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
                    itemBuilder: (BuildContext context, int index) {
                      // Ensure average_rating has an entry for this index
                      double avgRating =
                          (index < controller.average_rating.length)
                              ? controller.average_rating[index]
                              : 0.0; // Default to 0.0 if no rating is available

                      return ServiceContainer(
                        title: controller.laundries[index]["name"],
                        description: controller.laundries[index]["Description"],
                        price: '25K',
                        buttonText: "Pesan Sekarang",
                        icon: Icons.star_rounded,
                        avgRating: avgRating,
                        onPressed: () {
                          if (controller.laundries[index]["name"] ==
                              "Regular Clean") {
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
      ),
    );
  }
}
