// To parse this JSON data, do
//
//     final userDataModel = userDataModelFromJson(jsonString);

import 'dart:convert';

UserDataModel userDataModelFromJson(String str) => UserDataModel.fromJson(json.decode(str));

String userDataModelToJson(UserDataModel data) => json.encode(data.toJson());

class UserDataModel {
  UserDataModel({
    this.query,
    this.itineraryForm,
  });

  Query? query;
  List<dynamic>? itineraryForm;

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
    query: Query.fromJson(json["query"]),
    itineraryForm: List<dynamic>.from(json["itineraryForm"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "query": query?.toJson(),
    "itineraryForm": List<dynamic>.from(itineraryForm!.map((x) => x)),
  };
}

class Query {
  Query({
    this.userBooked,
    this.travelBy,
    this.arrivalDate,
    this.adults,
    this.childrens,
    this.totalDaysStay,
    this.travelerType,
    this.interests,
  });

  bool? userBooked;
  String? travelBy;
  dynamic arrivalDate;
  int? adults;
  int? childrens;
  int? totalDaysStay;
  String? travelerType;
  List<String>? interests;

  factory Query.fromJson(Map<String, dynamic> json) => Query(
    userBooked: json["userBooked"],
    travelBy: json["travelBy"],
    arrivalDate: DateTime.parse(json["arrivalDate"]),
    adults: json["adults"],
    childrens: json["childrens"],
    totalDaysStay: json["totalDaysStay"],
    travelerType: json["travelerType"],
    interests: List<String>.from(json["interests"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "userBooked": userBooked,
    "travelBy": travelBy,
    "arrivalDate": arrivalDate,
    "adults": adults,
    "childrens": childrens,
    "totalDaysStay": totalDaysStay,
    "travelerType": travelerType,
    "interests": List<dynamic>.from(interests!.map((x) => x)),
  };
}
