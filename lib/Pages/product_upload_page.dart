import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:general_cargo/Pages/product/status_update_page.dart';
import 'package:get/get.dart';

class ProductScannerPage extends StatefulWidget {
  @override
  State<ProductScannerPage> createState() => _ProductScannerPageState();
}

class _ProductScannerPageState extends State<ProductScannerPage> {
  var getResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('QR Scanner'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              scanQRCode();
            },
            child: Container(
                alignment: Alignment.center,
                width: 180.w,
                height: 40.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.deepPurple),
                child: Text(
                  'Scan Product QR',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 15.sp),
                )),
          ),
          SizedBox(
            height: 20.0,
          ),
           Container(
                alignment: Alignment.center,
                width: 180.w,
                height: 40.h,
              
                child: Text(
                  'Product Code is :$getResult',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 15.sp),
                )),
                 SizedBox(
            height: 20.0,
          ),
          getResult.isEmpty
              ? Container()
              : InkWell(
                  onTap: () {
                    Get.to(
                        transition: Transition.leftToRight, StatusUpdatePage());
                  },
                  child: Container(
                      alignment: Alignment.center,
                      width: 180.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Colors.deepPurple),
                      child: Text(
                        'Scan Product QR',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 15.sp),
                      )),
                ),
        ],
      )),
    );
  }

  void scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);

      if (!mounted) return;

      setState(() {
        getResult = qrCode;
      });
      print("QRCode_Result:--");
      print(qrCode);
    } on PlatformException {
      getResult = 'Failed to scan QR Code.';
    }
  }
}
