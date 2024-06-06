import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:seatu_ersih/app/pages/features/data_pelanggan_reg/widget/textfieldata.dart';
import 'package:seatu_ersih/themes/colors.dart';
import 'package:seatu_ersih/themes/fonts.dart';

class DataPelangganRegView extends StatelessWidget {
  const DataPelangganRegView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Data Pelanggan',
          style: Fonts.headerBlack,
        ),
        leading: Image.asset('assets/img/angle-circle-right 1.png'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Alamat',
                    style: Fonts.header1.copyWith(color: Colors.black),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Alamat lokasi pengambilan sepatu',
                    style: Fonts.detail,
                  ),
                ),
              ),
              SizedBox(
                height: 7,
              ),
              TextFieldData(),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Contact',
                    style: Fonts.header1.copyWith(color: Colors.black),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'No. Telephone',
                    style: Fonts.detail,
                  ),
                ),
              ),
              SizedBox(
                height: 7,
              ),
              TextFieldData(),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Jadwal',
                    style: Fonts.header1.copyWith(color: Colors.black),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Tanggal pengambillan',
                    style: Fonts.detail,
                  ),
                ),
              ),
              SizedBox(
                height: 7,
              ),
              TextFieldData(),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Note',
                    style: Fonts.header1.copyWith(color: Colors.black),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Berikan pesan tentang alamat mu',
                    style: Fonts.detail,
                  ),
                ),
              ),
              SizedBox(
                height: 7,
              ),
              TextFieldData(),
              Padding(
                padding: const EdgeInsets.only(top: 150.0),
                child: GestureDetector(
                  child: Container(
                      width: double.infinity,
                      height: 55,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Next',
                          style: Fonts.header1.copyWith(
                              fontWeight: FontWeight.w100, fontSize: 18),
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
