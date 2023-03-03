// To parse this JSON data, do
//
//     final singleEventsModel = singleEventsModelFromJson(jsonString);

import 'dart:convert';

SingleEventsModel singleEventsModelFromJson(String str) => SingleEventsModel.fromJson(json.decode(str));

String singleEventsModelToJson(SingleEventsModel data) => json.encode(data.toJson());

class SingleEventsModel {
  SingleEventsModel({
    this.data,
  });

  Data? data;

  factory SingleEventsModel.fromJson(Map<String, dynamic> json) => SingleEventsModel(
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
  });

  int? id;
  List<String>? images;
  List<dynamic>? videos;
  List<dynamic>? testimonials;
  List<dynamic>? category;
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    images: List<String>.from(json["images"].map((x) => x)),
    videos: List<dynamic>.from(json["videos"].map((x) => x)),
    testimonials: List<dynamic>.from(json["testimonials"].map((x) => x)),
    category: List<dynamic>.from(json["category"].map((x) => x)),
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
