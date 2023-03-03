// To parse this JSON data, do
//
//     final singleRecreationalModel = singleRecreationalModelFromJson(jsonString);

import 'dart:convert';

SingleRecreationalModel singleRecreationalModelFromJson(String str) => SingleRecreationalModel.fromJson(json.decode(str));

String singleRecreationalModelToJson(SingleRecreationalModel data) => json.encode(data.toJson());

class SingleRecreationalModel {
  SingleRecreationalModel({
    this.data,
  });

  Data? data;

  factory SingleRecreationalModel.fromJson(Map<String, dynamic> json) => SingleRecreationalModel(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.images,
    this.videos,
    this.testimonials,
    this.category,
    this.coordinates,
    this.placeId,
    this.name,
    this.description,
    this.type,
    this.modeOfBooking,
    this.reviewLinks,
    this.bestTimeToVisit,
    this.mustDo,
    this.seniorCitizenCompatibility,
    this.petsAllowed,
  });

  int? id;
  List<String>? images;
  List<dynamic>? videos;
  List<dynamic>? testimonials;
  List<String>? category;
  Coordinates? coordinates;
  int? placeId;
  String? name;
  String? description;
  String? type;
  List<dynamic>? modeOfBooking;
  List<dynamic>? reviewLinks;
  String? bestTimeToVisit;
  List<dynamic>? mustDo;
  bool? seniorCitizenCompatibility;
  bool? petsAllowed;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    images: List<String>.from(json["images"].map((x) => x)),
    videos: List<dynamic>.from(json["videos"].map((x) => x)),
    testimonials: List<dynamic>.from(json["testimonials"].map((x) => x)),
    category: List<String>.from(json["category"].map((x) => x)),
    coordinates: Coordinates.fromJson(json["coordinates"]),
    placeId: json["placeId"],
    name: json["name"],
    description: json["description"],
    type: json["type"],
    modeOfBooking: List<dynamic>.from(json["modeOfBooking"].map((x) => x)),
    reviewLinks: List<dynamic>.from(json["reviewLinks"].map((x) => x)),
    bestTimeToVisit: json["bestTimeToVisit"],
    mustDo: List<dynamic>.from(json["mustDo"].map((x) => x)),
    seniorCitizenCompatibility: json["seniorCitizenCompatibility"],
    petsAllowed: json["petsAllowed"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "images": List<dynamic>.from(images!.map((x) => x)),
    "videos": List<dynamic>.from(videos!.map((x) => x)),
    "testimonials": List<dynamic>.from(testimonials!.map((x) => x)),
    "category": List<dynamic>.from(category!.map((x) => x)),
    "coordinates": coordinates!.toJson(),
    "placeId": placeId,
    "name": name,
    "description": description,
    "type": type,
    "modeOfBooking": List<dynamic>.from(modeOfBooking!.map((x) => x)),
    "reviewLinks": List<dynamic>.from(reviewLinks!.map((x) => x)),
    "bestTimeToVisit": bestTimeToVisit,
    "mustDo": List<dynamic>.from(mustDo!.map((x) => x)),
    "seniorCitizenCompatibility": seniorCitizenCompatibility,
    "petsAllowed": petsAllowed,
  };
}

class Coordinates {
  Coordinates({
    this.type,
    this.coordinates,
  });

  String? type;
  List<double>? coordinates;

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
    type: json["type"],
    coordinates: List<double>.from(json["coordinates"].map((x) => x.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "coordinates": List<dynamic>.from(coordinates!.map((x) => x)),
  };
}
