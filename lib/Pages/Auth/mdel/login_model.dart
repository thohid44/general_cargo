// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));


class LoginModel {
    User? user;
    String? token;
    String? message;

    LoginModel({
        this.user,
        this.token,
        this.message,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        user: User.fromJson(json["user"]),
        token: json["token"],
        message: json["message"],
    );

    
}

class User {
    int? id;
    String? name;
    String? email;
    String? type;
    String? status;
    var image;

    User({
        this.id,
        this.name,
        this.email,
        this.type,
        this.status,
        this.image,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        type: json["type"],
        status: json["status"],
        image: json["image"],
    );

   
}
