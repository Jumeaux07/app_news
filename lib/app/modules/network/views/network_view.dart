import 'dart:async';

import 'package:app_news/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/network_controller.dart';

class NetworkView extends GetView<NetworkController> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), ()=>Get.offAndToNamed(AppPages.INITIAL));
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Text(
          "LOGO",
          style: TextStyle(
            color: Colors.white,
            fontSize: 45,
            fontWeight: FontWeight.bold
          ),
        ),
      )
    );
  }
}
