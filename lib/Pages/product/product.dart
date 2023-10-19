import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter_pagination/flutter_pagination.dart';
import 'package:flutter_pagination/widgets/button_styles.dart';
import 'package:general_cargo/Pages/product/controller/product_controller.dart';
import 'package:general_cargo/Pages/product/status_update_page.dart';
import 'package:general_cargo/Pages/product_upload_page.dart';
import 'package:general_cargo/Utils/colors.dart';
import 'package:get/get.dart';



class ProductView extends StatefulWidget {

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {


  TextEditingController searchController = TextEditingController();

  var petBreedId='';

  @override
  void initState() {
   
  }
   int currentPage = 1;
 var controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
       
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                color: lavenderColor
              ),
              child: Column(
                children: [
                         Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back(); 
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 20),
                              alignment: Alignment.center,
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Text("X",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  )),
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Container(
                            child: const Text(
                              "General Cargo",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          )
                        ],
                      ),
                  Container(
                    alignment: Alignment.center,
                    height: 45,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    color: lavenderColor,
                    child: TextField(
                      controller: searchController,
                      onChanged: (query) {
                    
                      },
                     
   decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search,
                            color: Colors.grey), // Prefix search icon
                        hintText: 'Search breed', // Hint text
                        filled: true,
                        fillColor: Colors.white, // Text field color
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(10.0), // Border radius
                        ),
                      ),

                    ),
                  ),
                ],
              ),
            ),
        Expanded(
              child: Obx(() => controller.isLoading.value == false?ListView.builder(
              itemCount:controller.productListModel!.paginator!.links!.length,
              itemBuilder: ((context, index) {
                return Container(
                  margin:const EdgeInsets.only(left: 15, right: 10, top: 15),
                  decoration: const BoxDecoration(
                        color: lavenderColor,
                  ),
                  child: ListTile(
                    onTap: (){
                      Get.to(ProductScannerPage());
                    },
                
                    title: Text(controller.productListModel!.paginator!.links![index].active.toString()), 
                    trailing: Icon(Icons.arrow_forward),
                    ),
                );
              })):Center(child: CircularProgressIndicator()))
             ),
                            
Pagination(
            paginateButtonStyles: PaginateButtonStyles(
             
            ),
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
            totalPage: 4,
            show: 2,
            currentPage: currentPage,
          )
          ],
        ),
      ),
    );
  }
}