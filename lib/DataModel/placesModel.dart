// To parse this JSON data, do
//
//     final onlyPlacesModel = onlyPlacesModelFromJson(jsonString);

import 'dart:convert';

OnlyPlacesModel onlyPlacesModelFromJson(String str) => OnlyPlacesModel.fromJson(json.decode(str));

String onlyPlacesModelToJson(OnlyPlacesModel data) => json.encode(data.toJson());

class OnlyPlacesModel {
  OnlyPlacesModel({
    this.data,
  });

  List<Data>? data;

  factory OnlyPlacesModel.fromJson(Map<String, dynamic> json) => OnlyPlacesModel(
    data: json["data"] == null ? [] : List<Data>.from(json["data"]!.map((x) => Data.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Data {
  Data({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
  };
}
