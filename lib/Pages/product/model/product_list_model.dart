

import 'dart:convert';

ProductListModel productListModelFromJson(String str) => ProductListModel.fromJson(json.decode(str));


class ProductListModel {
    String? message;
    Paginator? paginator;

    ProductListModel({
        this.message,
        this.paginator,
    });

    factory ProductListModel.fromJson(Map<String, dynamic> json) => ProductListModel(
        message: json["message"],
        paginator: Paginator.fromJson(json["paginator"]),
    );

 
}

class Paginator {
    int? currentPage;
    List<Datum>? data;
    String? firstPageUrl;
    int? from;
    int? lastPage;
    String? lastPageUrl;
    List<Link>? links;
    String? nextPageUrl;
    String? path;
    int? perPage;
    String? prevPageUrl;
    int? to;
    int? total;

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
    int? id;
    var date;
    String? invoiceNo;
    String? status;
    String? deliveryMode;
    dynamic image;
    String? senderName;
    String? senderPhone;
    String? senderAddress;
    String? receiverPhone;
    String? receiverName;
    String? receiverAddress;
    String? productDescription;
    String? quantity;
    String? unit;
    dynamic details;
    int? bookBranchId;
    int? desBranchId;
    int? serviceTypeId;
    String? bookBranch;
    String? desBranch;
    String? serviceType;
    dynamic signatureUrl;
    dynamic signatureUrlTwo;
    dynamic signatureDate;

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
    String? url;
    String? label;
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

    Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
    };
}
