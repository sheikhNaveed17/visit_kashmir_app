// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

List<Category> categoryFromJson(String str) => List<Category>.from(json.decode(str).map((x) => Category.fromJson(x)));

String categoryToJson(List<Category> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Category {
  Category({
    required this.icon,
    required this.text,
  });

  String icon;
  String text;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    icon: json["icon"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "icon": icon,
    "text": text,
  };
}
