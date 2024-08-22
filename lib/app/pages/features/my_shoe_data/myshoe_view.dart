import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih/app/pages/features/my_shoe_data/myshoe_contoller.dart';

class Myshoes extends GetView<MyShoeController> {
  const Myshoes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text('Sepatu saya'),
    ));
  }
}
