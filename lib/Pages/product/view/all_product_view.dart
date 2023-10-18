import 'package:flutter/material.dart';
import 'package:flutter_pagination/flutter_pagination.dart';
import 'package:flutter_pagination/widgets/button_styles.dart';
import 'package:general_cargo/Pages/product/controller/product_controller.dart';
import 'package:get/get.dart';

class AllProductView extends StatefulWidget {
  AllProductView({super.key});

  @override
  State<AllProductView> createState() => _AllProductViewState();
}

class _AllProductViewState extends State<AllProductView> {
  var controller = Get.put(ProductController());

   int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    controller.fetchProduct();
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("All Product"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Obx(() => controller.isLoading.value == false?ListView.builder(
                  itemCount:controller.productListModel!.paginator!.links!.length,
                  itemBuilder: ((context, index) {
                    return Container(
                      child: Text(controller.productListModel!.paginator!.links![index].active.toString()),
                    );
                  })):Center(child: CircularProgressIndicator())),

               
Pagination(
            paginateButtonStyles: PaginateButtonStyles(),
            prevButtonStyles: PaginateSkipButton(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20))),
            nextButtonStyles: PaginateSkipButton(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            onPageChange: (number) {
              setState(() {
                currentPage = number;
              });
            },
            useGroup: false,
            totalPage: 30,
            show: 2,
            currentPage: currentPage,
          )
        ],
      )
    ));
  }
}
