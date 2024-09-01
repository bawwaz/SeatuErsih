import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/Home_Page/HomepageController.dart';
import 'package:seatu_ersih/themes/colors.dart';
import 'package:seatu_ersih/themes/fonts.dart';
import 'package:seatu_ersih/themes/theme.dart';

class OrderContainer extends GetView<HomePageController> {
  final String title;
  final String pickupDate;
  final String price;
  final String status;
  final int id;
  final String? decline_note;

  const OrderContainer({
    Key? key,
    required this.decline_note,
    required this.id,
    required this.title,
    required this.pickupDate,
    required this.price,
    required this.status,
  }) : super(key: key);

  Widget getStatusIcon(String status) {
    switch (status) {
      case 'pending':
        return SvgPicture.asset('assets/svg/pending.svg');
      case 'waiting_for_payment':
        return SvgPicture.asset('assets/svg/wait.svg');
      case 'in-progress':
        return SvgPicture.asset('assets/svg/inprogress2.svg');
      case 'completed':
        return SvgPicture.asset('assets/svg/completed.svg');
      case 'decline':
        return InkWell(
          onTap: () {
            if (decline_note != null && decline_note!.isNotEmpty) {
              Get.snackbar('Decline Note', decline_note!,
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: primaryColor,
                  colorText: Colors.white);
            }
          },
          child: SvgPicture.asset('assets/svg/decline.svg'),
        );
      default:
        return SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        height: 134,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 1.2,
              spreadRadius: 0,
              offset: Offset(0, 0),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/img/Group 120.png'),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: Fonts.desc.copyWith(
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width / 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Column(
                            children: [
                              getStatusIcon(status),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text(
                      pickupDate,
                      style: Fonts.desc.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      price,
                      style: Fonts.detail.copyWith(
                        fontSize: 15,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    Text(
                      'Order id : $id',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
