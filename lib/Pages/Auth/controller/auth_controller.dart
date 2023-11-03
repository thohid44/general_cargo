import 'dart:convert';

import 'package:general_cargo/Pages/home_page.dart';
import 'package:general_cargo/Utils/localstorekey.dart';
import 'package:general_cargo/contrain/api_url.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  var isLogin= false.obs;
  var isLoading = false.obs;
  final _box = GetStorage();
  var userClient = http.Client();
  var url = "${baseUrl}/login";

  login(email, password) async {
    try {
      print("object");
      var mapData = {"email": "admin@gmail.com", "password": '12345'};
      isLogin(true);
      var response = await http.post(Uri.parse(url), 
      headers: {
        'Accept': 'application/json'
      },
      body: mapData);
         var jsonData = jsonDecode(response.body);
      
        print(jsonData); 
      if (response.statusCode == 202) {
     
        var getToken = jsonData['token'];
        _box.write(LocalStoreKey.token, getToken);

        print(_box.read(LocalStoreKey.token));
        if (getToken != null) {
          Get.offAll(HomePage());
        }
      }

      isLogin(false);
    } catch (e) {
      isLogin(false);
      print("Error $e");
    }
  }
}
