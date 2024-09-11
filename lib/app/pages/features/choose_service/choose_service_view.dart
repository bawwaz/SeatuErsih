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
                        String productName =
                            controller.laundries[index]["name"];
                        // Deklarasi variabel price hanya sekali
                        String price =
                            controller.laundries[index]["price"] ?? "N/A";

                        // Kondisi untuk Regular dan Deep Clean
                        if (productName == "Regular Clean") {
                          price = controller.laundries[index]["price"] ?? "N/A";
                        } else if (productName == "Deep Clean") {
                          price = controller.laundries[index]["price"] ?? "N/A";
                        }

                        return ServiceContainer(
                          title: productName,
                          description: controller.laundries[index]
                              ["description"],
                          price: price,
                          buttonText: "Pesan Sekarang",
                          onPressed: () {
                            print("Clicked: $productName");
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
                    ),
            ],
          );
        }),
      ),
    );
  }
}
