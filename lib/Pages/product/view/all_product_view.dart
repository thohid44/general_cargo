import 'package:flutter/material.dart';
import 'package:general_cargo/Pages/product/controller/product_controller.dart';
import 'package:get/get.dart';

class AllProductView extends StatelessWidget {
  AllProductView({super.key});
  var controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    controller.getMyTrips();
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("All Product"),
        centerTitle: true,
      ),
      body: ListView.builder(
              itemCount: controller.paginator!.data!.length,
              itemBuilder: ((context, index) {
                return Container(
                  child: Text(controller.paginator!.links![index].label.toString()),
                );
              }))
    ));
  }
}
