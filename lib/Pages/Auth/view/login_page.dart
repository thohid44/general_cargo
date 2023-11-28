import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:general_cargo/Pages/Auth/controller/auth_controller.dart';
import 'package:general_cargo/Utils/colors.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  var controller = Get.put(AuthController());
  bool visible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
  SizedBox(height: 70.h,), 
            Container(
                      height: 200.h,
                    width: 300.w,
                    child: Image.asset("assets/banner.png"),
                  ), 
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              height: 300.h,
              decoration: BoxDecoration(
                  color: Color(0xff0F4B7E),
                  borderRadius: BorderRadius.circular(15.r)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Container(
                    height: 45.h,
                    width: 300.w,
                    child: TextField(
                        controller: email,
                        decoration: InputDecoration(
                          hintText: "Your Email",
                          hintStyle:
                              TextStyle(fontSize: 15.sp, color: Colors.white),
                        )),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    height: 45.h,
                    width: 300.w,
                    child: TextField(
                        controller: password,
                        obscureText: visible,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  visible = !visible; 
                                });
                              },
                              icon:visible ==true?Icon(
                                Icons.visibility_off,
                                color: Colors.white,
                              ) :Icon(
                                Icons.visibility,
                                color: Colors.white,
                              )),
                          hintText: "Your Password",
                          hintStyle:
                              TextStyle(fontSize: 15.sp, color: Colors.white),
                        )),
                  ),
                  SizedBox(height: 40.h),
                  Obx(() => controller.isLogin.value == false
                      ? InkWell(
                          onTap: () {
                            controller.login(email.text.toString(),
                                password.text.toString());
                          },
                          child: Container(
                            height: 45,
                            width: 180,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Color(0xffCA0303),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "Log in",
                              style: TextStyle(
                                  fontSize: 17.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      : Center(child: CircularProgressIndicator(
                        color: Colors.white,
                      )))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
