// To parse this JSON data, do
//
//     final the3EventsModel = the3EventsModelFromJson(jsonString);

import 'dart:convert';

The3EventsModel the3EventsModelFromJson(String str) => The3EventsModel.fromJson(json.decode(str));

String the3EventsModelToJson(The3EventsModel data) => json.encode(data.toJson());

class The3EventsModel {
  The3EventsModel({
    this.data,
    this.totalDocs,
    this.offset,
    this.limit,
    this.totalPages,
    this.page,
    this.pagingCounter,
    this.hasPrevPage,
    this.hasNextPage,
    this.prevPage,
    this.nextPage,
  });

  List<Data>? data;
  int? totalDocs;
  int? offset;
  int? limit;
  int? totalPages;
  int? page;
  int? pagingCounter;
  bool? hasPrevPage;
  bool? hasNextPage;
  dynamic prevPage;
  int? nextPage;

  factory The3EventsModel.fromJson(Map<String, dynamic> json) => The3EventsModel(
    data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
    totalDocs: json["totalDocs"],
    offset: json["offset"],
    limit: json["limit"],
    totalPages: json["totalPages"],
    page: json["page"],
    pagingCounter: json["pagingCounter"],
    hasPrevPage: json["hasPrevPage"],
    hasNextPage: json["hasNextPage"],
    prevPage: json["prevPage"],
    nextPage: json["nextPage"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "totalDocs": totalDocs,
    "offset": offset,
    "limit": limit,
    "totalPages": totalPages,
    "page": page,
    "pagingCounter": pagingCounter,
    "hasPrevPage": hasPrevPage,
    "hasNextPage": hasNextPage,
    "prevPage": prevPage,
    "nextPage": nextPage,
  };
}

class Data {
  Data({
    required this.id,
    this.images,
    this.videos,
    this.testimonials,
    this.category,
    this.coordinates,
    this.placeId,
    this.attractionId,
    this.name,
    this.description,
    this.startDate,
    this.endDate,
    this.startingHrs,
    this.endingHrs,
    this.seniorCetizenCompatibility,
    this.petsAllowed,
    this.restroomAvailability,
    this.modeOfBooking,
    this.extras,
  });

  int id;
  List<dynamic>? images;
  List<dynamic>? videos;
  List<dynamic>? testimonials;
  List<String>? category;
  Coordinates? coordinates;
  int? placeId;
  int? attractionId;
  String? name;
  String? description;
  DateTime? startDate;
  DateTime? endDate;
  String? startingHrs;
  String? endingHrs;
  bool? seniorCetizenCompatibility;
  bool? petsAllowed;
  bool? restroomAvailability;
  List<String>? modeOfBooking;
  List<String>? extras;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    images: List<dynamic>.from(json["images"].map((x) => x)),
    videos: List<dynamic>.from(json["videos"].map((x) => x)),
    testimonials: List<dynamic>.from(json["testimonials"].map((x) => x)),
    category: List<String>.from(json["category"].map((x) => x)),
    coordinates: Coordinates.fromJson(json["coordinates"]),
    placeId: json["placeId"],
    attractionId: json["attractionId"],
    name: json["name"],
    description: json["description"],
    startDate: DateTime.parse(json["startDate"]),
    endDate: DateTime.parse(json["endDate"]),
    startingHrs: json["startingHrs"],
    endingHrs: json["endingHrs"],
    seniorCetizenCompatibility: json["seniorCetizenCompatibility"],
    petsAllowed: json["petsAllowed"],
    restroomAvailability: json["restroomAvailability"],
    modeOfBooking: List<String>.from(json["modeOfBooking"].map((x) => x)),
    extras: List<String>.from(json["extras"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "images": List<dynamic>.from(images!.map((x) => x)),
    "videos": List<dynamic>.from(videos!.map((x) => x)),
    "testimonials": List<dynamic>.from(testimonials!.map((x) => x)),
    "category": List<dynamic>.from(category!.map((x) => x)),
    "coordinates": coordinates!.toJson(),
    "placeId": placeId,
    "attractionId": attractionId,
    "name": name,
    "description": description,
    "startDate": startDate!.toIso8601String(),
    "endDate": endDate!.toIso8601String(),
    "startingHrs": startingHrs,
    "endingHrs": endingHrs,
    "seniorCetizenCompatibility": seniorCetizenCompatibility,
    "petsAllowed": petsAllowed,
    "restroomAvailability": restroomAvailability,
    "modeOfBooking": List<dynamic>.from(modeOfBooking!.map((x) => x)),
    "extras": List<dynamic>.from(extras!.map((x) => x)),
  };
}

class Coordinates {
  Coordinates({
    required this.type,
    required this.coordinates,
  });

  String? type;
  List<double>? coordinates;

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
    type: json["type"],
    coordinates: List<double>.from(json["coordinates"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "coordinates": List<dynamic>.from(coordinates!.map((x) => x)),
  };
}
