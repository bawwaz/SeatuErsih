import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih/app/router/app_pages.dart';
import 'package:seatu_ersih/themes/colors.dart';
import 'package:seatu_ersih/themes/fonts.dart';
import 'slider.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int _currentPage = 0;
  PageController _controller = PageController();

  List<Widget> _pages = [
    SliderPage(
      titleWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Seatu Ersih',
            style: Fonts.header1blu,
          ),
        ],
      ),
      bodyWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Sepatu Resik Dadine Apik, 1-2 hari selesai! dengan fitur aplikasi memudahkan dan menjadi efisien untuk booking pencucian",
            style: Fonts.onboarding,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      image: "assets/img/logo-splash.png",
    ),
    SliderPage(
      titleWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Kepentingan Jasa kami",
            style: Fonts.header1blu,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      bodyWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Higenitas pakaian sangat lah penting untuk lingkungan kantor sekolah & sehari-hari, tidak perlu merepotkan diri sendiri dengan jasa kami",
            style: Fonts.onboarding,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      image: "assets/img/unboxing 2.png",
    ),
    SliderPage(
      titleWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Efisien & Tidak membuang waktu",
            style: Fonts.header1blu,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      bodyWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Dengan beberapa tekanan tombol sepatu anda akan terlihat seperti baru!",
            style: Fonts.onboarding,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      image: "assets/img/productivity 1.png",
    ),
  ];

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            scrollDirection: Axis.horizontal,
            onPageChanged: _onchanged,
            controller: _controller,
            itemCount: _pages.length,
            itemBuilder: (context, int index) {
              return _pages[index];
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(_pages.length, (int index) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    height: 10,
                    width: (index == _currentPage) ? 30 : 10,
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: (index == _currentPage)
                          ? AppColors.primaryColor
                          : Colors.grey.withOpacity(0.5),
                    ),
                  );
                }),
              ),
              InkWell(
                onTap: () {
                  if (_currentPage == (_pages.length - 1)) {
                    Get.toNamed(Routes.REGIS);
                  } else {
                    _controller.nextPage(
                      duration: Duration(milliseconds: 800),
                      curve: Curves.easeInOutQuint,
                    );
                  }
                },
                child: AnimatedContainer(
                  alignment: Alignment.center,
                  duration: Duration(milliseconds: 300),
                  height: 70,
                  width: (_currentPage == (_pages.length - 1)) ? 200 : 75,
                  decoration: BoxDecoration(
                    color: AppColors
                        .primaryColor, // Replace with your actual secondary color
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: (_currentPage == (_pages.length - 1))
                      ? Text(
                          "Bergabung",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      : Icon(
                          Icons.navigate_next,
                          size: 50,
                          color: Colors.white,
                        ),
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ],
      ),
    );
  }
}
