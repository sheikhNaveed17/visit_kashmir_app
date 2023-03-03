// To parse this JSON data, do
//
//     final userUpdateProfile = userUpdateProfileFromJson(jsonString);

import 'dart:convert';

OtpModel OtpModelFromJson(String str) => OtpModel.fromJson(json.decode(str));

String OtpModelToJson(OtpModel data) => json.encode(data.toJson());

class OtpModel {
  OtpModel({
    this.message,
    this.user,
  });

  String? message;
  User? user;

  factory OtpModel.fromJson(Map<String, dynamic> json) => OtpModel(
    message: json["message"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "user": user?.toJson(),
  };
}

class User {
  User({
    this.phone,
    this.id,
  });

  int ?phone;
  int? id;

  factory User.fromJson(Map<String, dynamic> json) => User(
    phone: json["phone"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "phone": phone,
    "_id": id,
  };
}
