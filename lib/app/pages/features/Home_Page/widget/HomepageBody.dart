import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/Home_Page/HomepageController.dart';
import 'package:seatu_ersih/app/pages/features/Home_Page/widget/card_review.dart';
import 'package:seatu_ersih/app/pages/features/profile_page/profileController.dart';
import 'package:seatu_ersih/app/router/app_pages.dart';
import 'package:seatu_ersih/themes/colors.dart';
import 'package:seatu_ersih/themes/fonts.dart';
import 'package:seatu_ersih/app/pages/features/Home_Page/widget/orderservice.dart';

class HomeBody extends GetView<HomePageController> {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(ProfileController());
    final homeController = Get.put(HomePageController());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      homeController.fetchReviews1();
      homeController.fetchReviews2();
    });

    return DefaultTabController(
      length: 2,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 27, vertical: 13),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome,',
                        style: Fonts.slogan,
                      ),
                      Obx(
                        () => Text(
                          profileController.username.value,
                          style: Fonts.slogan,
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 100.0),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.CHOOSE_SERVICE);
                      },
                      child: OrderService(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            Center(
              child: Text(
                'Review Servis Kami!',
                style: Fonts.header1.copyWith(color: Colors.black),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorColor: AppColors.primaryColor,
                tabs: [
                  Tab(text: 'Regular Clean'),
                  Tab(text: 'Deep Clean'),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SizedBox(
                height: 300, // Tinggi PageView
                child: TabBarView(
                  children: [
                    // Tab 1: Regular Clean Reviews
                    Obx(() {
                      if (homeController.isLoading.value) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (homeController.reviews1.isEmpty) {
                        return Center(child: Text("No reviews found"));
                      }
                      return PageView.builder(
                        itemCount: (homeController.reviews1.length / 3)
                            .ceil(), // Jumlah halaman
                        itemBuilder: (context, pageIndex) {
                          int startIndex = pageIndex * 3;
                          int endIndex = startIndex + 3;
                          var reviewsPage = homeController.reviews1.sublist(
                            startIndex,
                            endIndex > homeController.reviews1.length
                                ? homeController.reviews1.length
                                : endIndex,
                          );
                          return Column(
                            children: reviewsPage.map((review) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: CardReview(review: review),
                              );
                            }).toList(),
                          );
                        },
                      );
                    }),
                    // Tab 2: Deep Clean Reviews
                    Obx(() {
                      if (homeController.isLoading.value) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (homeController.reviews2.isEmpty) {
                        return Center(child: Text("No reviews found"));
                      }
                      return PageView.builder(
                        itemCount: (homeController.reviews2.length / 3)
                            .ceil(), // Jumlah halaman
                        itemBuilder: (context, pageIndex) {
                          int startIndex = pageIndex * 3;
                          int endIndex = startIndex + 3;
                          var reviewsPage = homeController.reviews2.sublist(
                            startIndex,
                            endIndex > homeController.reviews2.length
                                ? homeController.reviews2.length
                                : endIndex,
                          );
                          return Column(
                            children: reviewsPage.map((review) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: CardReview(review: review),
                              );
                            }).toList(),
                          );
                        },
                      );
                    }),
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
