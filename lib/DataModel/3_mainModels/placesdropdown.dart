// To parse this JSON data, do
//
//     final placesdropdown = placesdropdownFromJson(jsonString);

import 'dart:convert';

Placesdropdown placesdropdownFromJson(String str) => Placesdropdown.fromJson(json.decode(str));

String placesdropdownToJson(Placesdropdown data) => json.encode(data.toJson());

class Placesdropdown {
  Placesdropdown({
    required this.data,
  });

  List<Data> data;

  factory Placesdropdown.fromJson(Map<String, dynamic> json) => Placesdropdown(
    data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Data {
  Data({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
  };
}
