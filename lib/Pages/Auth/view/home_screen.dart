import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            
              InkWell(
                              onTap: () {
                             
                              },
                              child: Container(
                                height: 45,
                                width: 250,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Color(0xff0F4B7E),
                                    borderRadius: BorderRadius.circular(30.r)),
                                child: Text(
                                  "Scan your Tracking Code",
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h,), 
                              InkWell(
                              onTap: () {
                             
                              },
                              child: Container(
                                height: 45,
                                     width: 250,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Color(0xffCA0303),
                                    borderRadius: BorderRadius.circular(30.r)),
                                child: Text(
                                  "Search your Tracking No",
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
            ],
          ),
        ),
      ),
    );
  }
}
