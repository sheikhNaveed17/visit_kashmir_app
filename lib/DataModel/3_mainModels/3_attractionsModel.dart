// To parse this JSON data, do
//
//     final top3AttractionsModel = top3AttractionsModelFromJson(jsonString);

import 'dart:convert';

Top3AttractionsModel top3AttractionsModelFromJson(String str) => Top3AttractionsModel.fromJson(json.decode(str));

String top3AttractionsModelToJson(Top3AttractionsModel data) => json.encode(data.toJson());

class Top3AttractionsModel {
  Top3AttractionsModel({
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

  factory Top3AttractionsModel.fromJson(Map<String, dynamic> json) => Top3AttractionsModel(
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
    this.placeId,
    this.name,
    this.description,
    this.knownFor,
    this.extraInfo,
    this.restroomAvailability,
    this.modeOfBooking,
    this.thingsToDo,
    this.createdAt,
    this.updatedAt,
    this.rating,
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
  List<String>? knownFor;
  List<dynamic>? extraInfo;
  bool? restroomAvailability;
  List<dynamic>? modeOfBooking;
  List<String>? thingsToDo;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? rating;

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
    knownFor: List<String>.from(json["knownFor"].map((x) => x)),
    extraInfo: List<dynamic>.from(json["extraInfo"].map((x) => x)),
    restroomAvailability: json["restroomAvailability"],
    modeOfBooking: List<dynamic>.from(json["modeOfBooking"].map((x) => x)),
    thingsToDo: List<String>.from(json["thingsToDo"].map((x) => x)),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    rating: json["rating"],
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
    "knownFor": List<dynamic>.from(knownFor!.map((x) => x)),
    "extraInfo": List<dynamic>.from(extraInfo!.map((x) => x)),
    "restroomAvailability": restroomAvailability,
    "modeOfBooking": List<dynamic>.from(modeOfBooking!.map((x) => x)),
    "thingsToDo": List<dynamic>.from(thingsToDo!.map((x) => x)),
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
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
