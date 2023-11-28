import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:general_cargo/screen/view/my_home_page.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState()  {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Get.offAll(MyHomePage()); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 140.w,
            height: 140.h,
            child: Image.asset(
              "assets/logo.png",
              width: 150.w,
              height: 150.h,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100.w,
                height: 23.h,
                child: Image.asset("assets/general.png"),
              ),
              Container(
                width: 100.w,
                height: 20.h,
                child: Image.asset("assets/cargo.png"),
              ),
            ],
          )
        ],
      ),
      
    ));
  }
}
