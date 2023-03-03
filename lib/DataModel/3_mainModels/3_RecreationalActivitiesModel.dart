// To parse this JSON data, do
//
//     final the3RecreationalActivitiesModel = the3RecreationalActivitiesModelFromJson(jsonString);

import 'dart:convert';

The3RecreationalActivitiesModel the3RecreationalActivitiesModelFromJson(String str) => The3RecreationalActivitiesModel.fromJson(json.decode(str));

String the3RecreationalActivitiesModelToJson(The3RecreationalActivitiesModel data) => json.encode(data.toJson());

class The3RecreationalActivitiesModel {
  The3RecreationalActivitiesModel({
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

  factory The3RecreationalActivitiesModel.fromJson(Map<String, dynamic> json) => The3RecreationalActivitiesModel(
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
    this.type,
    this.modeOfBooking,
    this.reviewLinks,
    this.bestTimeToVisit,
    this.mustDo,
    this.seniorCitizenCompatibility,
    this.petsAllowed,
  });

  int? id;
  List<dynamic>? images;
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
    images: List<dynamic>.from(json["images"].map((x) => x)),
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
