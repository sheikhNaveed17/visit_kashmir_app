// To parse this JSON data, do
//
//     final the3AttractionsModel = the3AttractionsModelFromJson(jsonString);

import 'dart:convert';

singleAttractionsModel singleAttractionsModelFromJson(String str) => singleAttractionsModel.fromJson(json.decode(str));

String singleAttractionsModelToJson(singleAttractionsModel data) => json.encode(data.toJson());

class singleAttractionsModel {
  singleAttractionsModel({
    this.data,
  });

  Data? data;

  factory singleAttractionsModel.fromJson(Map<String, dynamic> json) => singleAttractionsModel(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
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
    this.name,
    this.description,
    this.knownFor,
    this.extraInfo,
    this.restroomAvailability,
    this.modeOfBooking,
    this.thingsToDo,
    this.rating,
  });

  int? id;
  List<String>? images;
  List<dynamic>? videos;
  List<dynamic>? testimonials;
  List<String>? category;
  Coordinates? coordinates;
  String? name;
  String? description;
  List<String>? knownFor;
  List<dynamic>? extraInfo;
  bool? restroomAvailability;
  List<dynamic>? modeOfBooking;
  List<String>? thingsToDo;
  int? rating;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    images: List<String>.from(json["images"].map((x) => x)),
    videos: List<dynamic>.from(json["videos"].map((x) => x)),
    testimonials: List<dynamic>.from(json["testimonials"].map((x) => x)),
    category: List<String>.from(json["category"].map((x) => x)),
    coordinates: Coordinates.fromJson(json["coordinates"]),
    name: json["name"],
    description: json["description"],
    knownFor: List<String>.from(json["knownFor"].map((x) => x)),
    extraInfo: List<dynamic>.from(json["extraInfo"].map((x) => x)),
    restroomAvailability: json["restroomAvailability"],
    modeOfBooking: List<dynamic>.from(json["modeOfBooking"].map((x) => x)),
    thingsToDo: List<String>.from(json["thingsToDo"].map((x) => x)),
    rating: json["rating"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "images": List<dynamic>.from(images!.map((x) => x)),
    "videos": List<dynamic>.from(videos!.map((x) => x)),
    "testimonials": List<dynamic>.from(testimonials!.map((x) => x)),
    "category": List<dynamic>.from(category!.map((x) => x)),
    "coordinates": coordinates!.toJson(),
    "name": name,
    "description": description,
    "knownFor": List<dynamic>.from(knownFor!.map((x) => x)),
    "extraInfo": List<dynamic>.from(extraInfo!.map((x) => x)),
    "restroomAvailability": restroomAvailability,
    "modeOfBooking": List<dynamic>.from(modeOfBooking!.map((x) => x)),
    "thingsToDo": List<dynamic>.from(thingsToDo!.map((x) => x)),
    "rating": rating,
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
