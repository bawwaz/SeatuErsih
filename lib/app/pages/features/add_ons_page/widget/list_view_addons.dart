import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih/app/pages/features/add_ons_page/add_ons_controller.dart';
import 'package:seatu_ersih/app/pages/features/add_ons_page/widget/addons_check_widget.dart';

class Addons extends GetView<AddOnsController> {
  const Addons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: controller.addOnsData.length,
      itemBuilder: (context, index) {
        return Obx(() => GestureDetector(
              onTap: () {
                if (controller.isSelected![index]!.value) {
                  controller.isSelected![index]!.value = false;
                  controller.removeAddOns(controller.addOnsData[index]['price'],
                      controller.addOnsData[index]['title']);
                } else {
                  controller.isSelected![index]!.value = true;
                  controller.addAddOns(controller.addOnsData[index]['price'],
                      controller.addOnsData[index]['title']);
                }
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 15),
                width: double.infinity,
                height: 88,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 2,
                    color: controller.isSelected![index]!.value
                        ? Color(0xFF7EC1EB)
                        : Colors.white,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 5,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    AddOnsCheckWidget(
                      index: index,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.addOnsData[index]['title'],
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            controller.addOnsData[index]['description'],
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF8A8A8A),
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ));
      },
    );
  }
}
