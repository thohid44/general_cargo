// To parse this JSON data, do
//
//     final productListModel = productListModelFromJson(jsonString);

import 'dart:convert';

ProductListModel productListModelFromJson(String str) => ProductListModel.fromJson(json.decode(str));



class ProductListModel {
    
    Paginator? paginator;

    ProductListModel({
      
        this.paginator,
    });

    factory ProductListModel.fromJson(Map<String, dynamic> json) => ProductListModel(
      
        paginator: Paginator.fromJson(json["paginator"]),
    );

   
}

class Paginator {
    var currentPage;
    List<Datum>? data;
    var firstPageUrl;
    var from;
    var lastPage;
    var lastPageUrl;
    List<Link>? links;
    var nextPageUrl;
    var path;
    var perPage;
    var prevPageUrl;
    var to;
    var total;

    Paginator({
        this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total,
    });

    factory Paginator.fromJson(Map<String, dynamic> json) => Paginator(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
    );

   
}

class Datum {
    var id;
    var date;
    var invoiceNo;
    var status;
    var deliveryMode;
    var image;
    var senderName;
    var senderPhone;
    var senderAddress;
    var receiverPhone;
    var receiverName;
    var receiverAddress;
    var productDescription;
    var quantity;
    var unit;
    var details;
    var bookBranchId;
    var desBranchId;
    var serviceTypeId;
    var bookBranch;
    var desBranch;
    var serviceType;
    var signatureUrl;
    var signatureUrlTwo;
    var signatureDate;

    Datum({
        this.id,
        this.date,
        this.invoiceNo,
        this.status,
        this.deliveryMode,
        this.image,
        this.senderName,
        this.senderPhone,
        this.senderAddress,
        this.receiverPhone,
        this.receiverName,
        this.receiverAddress,
        this.productDescription,
        this.quantity,
        this.unit,
        this.details,
        this.bookBranchId,
        this.desBranchId,
        this.serviceTypeId,
        this.bookBranch,
        this.desBranch,
        this.serviceType,
        this.signatureUrl,
        this.signatureUrlTwo,
        this.signatureDate,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        invoiceNo: json["invoice_no"],
        status: json["status"],
        deliveryMode: json["delivery_mode"],
        image: json["image"],
        senderName: json["sender_name"],
        senderPhone: json["sender_phone"],
        senderAddress: json["sender_address"],
        receiverPhone: json["receiver_phone"],
        receiverName: json["receiver_name"],
        receiverAddress: json["receiver_address"],
        productDescription: json["product_description"],
        quantity: json["quantity"],
        unit: json["unit"],
        details: json["details"],
        bookBranchId: json["book_branch_id"],
        desBranchId: json["des_branch_id"],
        serviceTypeId: json["service_type_id"],
        bookBranch: json["bookBranch"],
        desBranch: json["desBranch"],
        serviceType: json["serviceType"],
        signatureUrl: json["signature_url"],
        signatureUrlTwo: json["signature_url_two"],
        signatureDate: json["signature_date"],
    );

    
}

class Link {
    var url;
    var label;
    bool? active;

    Link({
        this.url,
        this.label,
        this.active,
    });

    factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
    );

}
