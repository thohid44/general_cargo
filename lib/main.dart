import 'package:flutter/material.dart';
import 'package:general_cargo/Pages/home_page.dart';
import 'package:general_cargo/Pages/product_upload_page.dart';
import 'package:general_cargo/Pages/signature_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'General Cargo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ProductUploadPage()
    );
  }
}
