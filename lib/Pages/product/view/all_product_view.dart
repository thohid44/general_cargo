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
            body: Obx(
              () => controller.isLoading.value == false
                  ? ListView.builder(
                      itemCount:
                          controller.paginator!.links!.length,
                      itemBuilder: ((context, index) {
                        print(
                            "length ${controller.paginator!.links!.length}");
                        return Container(
                          child: Text(
                              "${controller.productListModel!.paginator!.links![index].url.toString()}"),
                        );
                      }))
                  : Center(child: CircularProgressIndicator()),
            )));
  }
}
