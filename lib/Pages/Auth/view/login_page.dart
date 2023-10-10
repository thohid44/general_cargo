import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:general_cargo/Pages/Auth/controller/auth_controller.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Center(
            child: Container(
              width: 300.w,
              child: TextField(
                  controller: email,
                  decoration: InputDecoration(
                      labelText: "Your Email",
                      hintText: "Your Email",
                      hintStyle: TextStyle(fontSize: 15.sp, color: Colors.pink),
                      border: OutlineInputBorder())),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Center(
            child: Container(
              width: 300.w,
              child: TextField(
                  controller: password,
                  decoration: InputDecoration(
                      labelText: "Your Password",
                      hintText: "Your Password",
                      hintStyle: TextStyle(fontSize: 15.sp, color: Colors.pink),
                      border: OutlineInputBorder())),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
         Obx(() => controller.isLoading.value ==false? InkWell(
            onTap: () {
              controller.login(email.text.toString(), password.text.toString());
            },
            child: Container(
              height: 45,
              width: 200,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(10)),
              child: Text(
                "Log in",
                style: TextStyle(
                    fontSize: 17.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ):Center(child: CircularProgressIndicator()))
        ],
      ),
    );
  }
}
