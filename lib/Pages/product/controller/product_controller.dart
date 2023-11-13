import 'package:general_cargo/Pages/product/model/product_list_model.dart';
import 'package:general_cargo/Utils/localstorekey.dart';
import 'package:general_cargo/contrain/api_url.dart';
import 'package:get/get.dart';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  var isLoading = false.obs;

 ProductListModel? productListModel; 
  Paginator? paginator;

  final _box = GetStorage();

  var pth;
  void onInit() {
    super.onInit();
     fetchProduct();
  }

  fetchProduct() async {
    var token = _box.read(LocalStoreKey.token);

    try {
      isLoading(true);
      var response = await http.get(
        Uri.parse("${baseUrl}/product?page=1&status=DropOff"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + token,
        },
      );
      if (response.statusCode == 202) {
        var jsonData = jsonDecode(response.body);
     

       productListModel  = ProductListModel.fromJson(jsonData);
      
      
           print("thohid koli ${productListModel!.paginator!.links!.first.label.toString()}");
        isLoading(false);
      }
    } catch (e) {
      print("Error $e");
    }
  }
}
