// To parse this JSON data, do
//
//     final top3Places = the3PlacesFromJson(jsonString);

import 'dart:convert';

The3PlacesModel the3PlacesFromJson(String str) => The3PlacesModel.fromJson(json.decode(str));

String the3PlacesToJson(The3PlacesModel data) => json.encode(data.toJson());

class The3PlacesModel {
  The3PlacesModel({
    this.data,
    this.totalDocs,
    this.offset,
    this.limit,
    this.totalPages,
    this.page,
    this.pagingCounter,
    this.hasNextPage,
    this.hasPrevPage,
  });

  List<Data>? data;
  int? totalDocs;
  int? offset;
  int? limit;
  int? totalPages;
  int? page;
  int? pagingCounter;
  bool? hasNextPage;
  bool? hasPrevPage;

  factory The3PlacesModel.fromJson(Map<String, dynamic> json) => The3PlacesModel(
    data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
    totalDocs: json["totalDocs"],
    offset: json["offset"],
    limit: json["limit"],
    totalPages: json["totalPages"],
    page: json["page"],
    pagingCounter: json["pagingCounter"],
    hasNextPage: json["hasNextPage"],
    hasPrevPage: json["hasPrevPage"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "totalDocs": totalDocs,
    "offset": offset,
    "limit": limit,
    "totalPages": totalPages,
    "page": page,
    "pagingCounter": pagingCounter,
    "hasNextPage": hasNextPage,
    "hasPrevPage": hasPrevPage,
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
    this.thingsToDo,
    this.reviewLinks,
    this.bestTimeToVisit,
    this.mustDo,
  });


  int? id;
  List<dynamic>? images;
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
    images: List<dynamic>.from(json["images"].map((x) => x)),
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
