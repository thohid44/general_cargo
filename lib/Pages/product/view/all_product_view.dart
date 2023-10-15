import 'package:flutter/material.dart';
import 'package:general_cargo/Pages/product/controller/product_controller.dart';
import 'package:get/get.dart';

class AllProductView extends StatelessWidget {
  AllProductView({super.key});
  var controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    controller.fetchProduct();
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("All Product"),
        centerTitle: true,
      ),
      body: Obx(() => controller.isLoading.value == false?ListView.builder(
              itemCount:controller.productListModel!.paginator!.links!.length,
              itemBuilder: ((context, index) {
                return Container(
                  child: Text(controller.productListModel!.paginator!.links![index].active.toString()),
                );
              })):Center(child: CircularProgressIndicator()))
    ));
  }
}
