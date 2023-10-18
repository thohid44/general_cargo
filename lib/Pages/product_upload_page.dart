import 'dart:io';

import 'package:flutter/material.dart';
import 'package:general_cargo/Pages/product/status_update_page.dart';
import 'package:general_cargo/Utils/colors.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ProductUploadPage extends StatefulWidget {
  const ProductUploadPage({super.key});

  @override
  State<ProductUploadPage> createState() => _ProductUploadPageState();
}

class _ProductUploadPageState extends State<ProductUploadPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  Barcode? result;
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: lavenderColor,
        ),
        body: Column(
          children: <Widget>[
            Container(
            height: 200,
            margin: EdgeInsets.all(15),
                child: QRView(
              
              key: qrKey,
              onQRViewCreated: onQRViewCamera,
            )),
    
           
            Container(
              
              child: Center(
                child: ElevatedButton.icon(onPressed: (){
    
                }, icon: Icon(Icons.qr_code), label: (result !=null)?Text("Result: ${result!.code}"):Text("Scan Product"), )
            
              ),
            ),
    
            Container(
              
              child: Center(
                child: ElevatedButton.icon(onPressed: (){
    Get.to(StatusUpdatePage());
                }, icon: Icon(Icons.qr_code), label: Text("Update Status"), )
            
              ),
            )
    
          ],
        ),
      ),
    );
  }

  void onQRViewCamera(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void dispose() {
    controller?.dispose(); 
    super.dispose();
  }
}
