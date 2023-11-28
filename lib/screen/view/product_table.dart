import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:general_cargo/screen/controller/product_controller.dart';
import 'package:get/get.dart';

class ProductTablePage extends StatefulWidget {
  const ProductTablePage({super.key});

  @override
  State<ProductTablePage> createState() => _ProductTablePageState();
}

class _ProductTablePageState extends State<ProductTablePage> {
    var controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    controller.fetchProduct(); 
    return Scaffold(
      appBar: AppBar(title: Text("data"),),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           Obx(() => controller.isLoading.value ==false? DataTable(
                                        headingRowColor:
                                            MaterialStateColor.resolveWith(
                                                (states) => Colors.white),
                                        columnSpacing: 40.w,
                                        horizontalMargin: 10,
                                        dataRowHeight: 20.h,
                                        border: TableBorder.all(width: 1),
                                        columns: const <DataColumn>[
                                          DataColumn(label: Text("#")),
                                          DataColumn(label: Text("Edit")),
                                              DataColumn(label: Text(" Invoice No")),
                                         
                                          DataColumn(label: Text("Status")),
                                        ],
                                        rows:  controller.productListModel!.products!
                                            .map<DataRow>(
                                              (e) => DataRow(cells: <DataCell>[
                                                DataCell(Text(e.id.toString())),
                                                DataCell(Text(e.invoiceNo)),
                                                  DataCell(Text(e.invoiceNo)),
                                                DataCell(
                                                    Text(e.invoiceNo))
                                              ]),
                                            )
                                            .toList(),
                                      ):Center(child: CircularProgressIndicator())), 
                                    
                                  
          ],
        ),
      ),
    );
  }
}
