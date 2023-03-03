// To parse this JSON data, do
//
//     final userUpdateProfileOptional = userUpdateProfileOptionalFromJson(jsonString);

import 'dart:convert';

UserUpdateProfileOptional userUpdateProfileOptionalFromJson(String str) => UserUpdateProfileOptional.fromJson(json.decode(str));

String userUpdateProfileOptionalToJson(UserUpdateProfileOptional data) => json.encode(data.toJson());

class UserUpdateProfileOptional {
  UserUpdateProfileOptional({
    this.firstname,
    this.lastname,
    this.email,
  });

  String? firstname;
  String? lastname;
  String? email;

  factory UserUpdateProfileOptional.fromJson(Map<String, dynamic> json) => UserUpdateProfileOptional(
    firstname: json["firstname"],
    lastname: json["lastname"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "firstname": firstname,
    "lastname": lastname,
    "email": email,
  };
}
