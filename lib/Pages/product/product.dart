import 'dart:async';


import 'package:flutter/material.dart';
import 'package:general_cargo/Pages/product/controller/product_controller.dart';
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
                  child: Text(controller.productListModel!.paginator!.links![index].active.toString()),
                );
              })):Center(child: CircularProgressIndicator()))
             ),
          ],
        ),
      ),
    );
  }
}