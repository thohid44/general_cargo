
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:general_cargo/Pages/Auth/view/login_page.dart';
import 'package:general_cargo/Pages/home_page.dart';
import 'package:general_cargo/Utils/localstorekey.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() {
  
    HttpOverrides.global = MyHttpOverrides();
  runApp( MyApp());

}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
 
   return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
           return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'General Cargo',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: child
    ); 
      },
      child:  LoginPage(),
    );
  }
   final _box = GetStorage();

  ///
  bool checkUserType() {
    var result1 = _box.read(LocalStoreKey.token.toString());
    if (result1 != null) {
      Get.offAll(LoginPage());
      return true;
    }

    return false;
  }

}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
