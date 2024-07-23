import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/intial_pages/otp_page/otp_page_controller.dart';
import 'package:seatu_ersih/app/pages/intial_pages/otp_page/widget/otp_textfields.dart';
import 'package:seatu_ersih/themes/theme.dart';

class OtpPageView extends GetView<OtpPageController> {
  const OtpPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _pinController1 = TextEditingController();
    final TextEditingController _pinController2 = TextEditingController();
    final TextEditingController _pinController3 = TextEditingController();
    final TextEditingController _pinController4 = TextEditingController();
    final TextEditingController _pinController5 = TextEditingController();
    final TextEditingController _pinController6 = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(
              height: 139,
            ),
            Center(
              child: Text(
                'Verifikasi Handphone',
                style: tsTitleMediumBold(Colors.black),
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              'kode telah dikirim ke +62 82123983846',
              style: tsBodyMediumRegular(Colors.black),
            ),
            SizedBox(
              height: 25,
            ),
            OtpTextfields(),
            SizedBox(
              height: 30,
            ),
            Text(
              'Tidak mendapatkan kode otp?',
              style: tsBodyMediumRegular(Colors.black),
            ),
            SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: () {},
              child: Text(
                'kirim ulang',
                style: tsBodyMediumSemibold(primaryColor),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          String pinCode = _pinController1.text +
                      _pinController2.text +
                      _pinController3.text +
                      _pinController4.text +
                      _pinController5.text +
                      _pinController6.text;
                  // controller.verifyOtp(pinCode);
        },
        child: Container(
          height: 35,
          width: MediaQuery.sizeOf(context).width * 0.92,
          decoration: BoxDecoration(
              color: primaryColor, borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: Text(
            'Verifikasi',
            style: tsBodySmallBold(Colors.white),
          )),
        ),
      ),
    );
  }
}
