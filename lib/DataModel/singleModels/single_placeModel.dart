// To parse this JSON data, do
//
//     final singlePlaceModel = singlePlaceModelFromJson(jsonString);

import 'dart:convert';

SinglePlaceModel singlePlaceModelFromJson(String str) => SinglePlaceModel.fromJson(json.decode(str));

String singlePlaceModelToJson(SinglePlaceModel data) => json.encode(data.toJson());

class SinglePlaceModel {
  SinglePlaceModel({
    this.data,
  });

  Data? data;

  factory SinglePlaceModel.fromJson(Map<String, dynamic> json) => SinglePlaceModel(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.deletedFlag,
    this.images,
    this.videos,
    this.testimonials,
    this.category,
    this.coordinates,
    this.name,
    this.description,
    this.knownFor,
    this.thingsToDo,
    this.reviewLinks,
    this.bestTimeToVisit,
    this.mustDo,
  });

  int? id;
  bool? deletedFlag;
  List<String>? images;
  List<dynamic>? videos;
  List<dynamic>? testimonials;
  List<dynamic>? category;
  Coordinates? coordinates;
  String? name;
  String? description;
  List<String>? knownFor;
  List<dynamic>? thingsToDo;
  List<dynamic>? reviewLinks;
  String? bestTimeToVisit;
  List<dynamic>? mustDo;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    deletedFlag: json["deletedFlag"],
    images: List<String>.from(json["images"].map((x) => x)),
    videos: List<dynamic>.from(json["videos"].map((x) => x)),
    testimonials: List<dynamic>.from(json["testimonials"].map((x) => x)),
    category: List<dynamic>.from(json["category"].map((x) => x)),
    coordinates: Coordinates.fromJson(json["coordinates"]),
    name: json["name"],
    description: json["description"],
    knownFor: List<String>.from(json["knownFor"].map((x) => x)),
    thingsToDo: List<dynamic>.from(json["thingsToDo"].map((x) => x)),
    reviewLinks: List<dynamic>.from(json["reviewLinks"].map((x) => x)),
    bestTimeToVisit: json["bestTimeToVisit"],
    mustDo: List<dynamic>.from(json["mustDo"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "deletedFlag": deletedFlag,
    "images": List<dynamic>.from(images!.map((x) => x)),
    "videos": List<dynamic>.from(videos!.map((x) => x)),
    "testimonials": List<dynamic>.from(testimonials!.map((x) => x)),
    "category": List<dynamic>.from(category!.map((x) => x)),
    "coordinates": coordinates!.toJson(),
    "name": name,
    "description": description,
    "knownFor": List<dynamic>.from(knownFor!.map((x) => x)),
    "thingsToDo": List<dynamic>.from(thingsToDo!.map((x) => x)),
    "reviewLinks": List<dynamic>.from(reviewLinks!.map((x) => x)),
    "bestTimeToVisit": bestTimeToVisit,
    "mustDo": List<dynamic>.from(mustDo!.map((x) => x)),
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
