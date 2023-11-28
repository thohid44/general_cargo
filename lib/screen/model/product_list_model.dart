// To parse this JSON data, do
//
//     final productListModel = productListModelFromJson(jsonString);

import 'dart:convert';

ProductListModel productListModelFromJson(String str) =>
    ProductListModel.fromJson(json.decode(str));

class ProductListModel {
  List<Product>? products;

  ProductListModel({
    this.products,
  });

  factory ProductListModel.fromJson(Map<String, dynamic> json) =>
      ProductListModel(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );
}

class Product {
  int? id;
  var date;
  var invoiceNo;
 
  Product({
    this.id,
    this.date,
    this.invoiceNo,
    
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        invoiceNo: json["invoice_no"],
        
      );
}

class StatusElement {
  int? id;
  int? userId;
  int? productId;
  var status;
  var image;
  var createdAt;
  dynamic updatedAt;
  var details;

  StatusElement({
    this.id,
    this.userId,
    this.productId,
    this.status,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.details,
  });

  factory StatusElement.fromJson(Map<String, dynamic> json) => StatusElement(
        id: json["id"],
        userId: json["user_id"],
        productId: json["product_id"],
        status: json["status"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        details: json["details"],
      );
}
