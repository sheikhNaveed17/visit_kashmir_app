// To parse this JSON data, do
//
//     final universalDetailScreenModel = universalDetailScreenModelFromJson(jsonString);

import 'dart:convert';

UniversalDetailScreenModel universalDetailScreenModelFromJson(String str) => UniversalDetailScreenModel.fromJson(json.decode(str));

String universalDetailScreenModelToJson(UniversalDetailScreenModel data) => json.encode(data.toJson());

class UniversalDetailScreenModel {
  UniversalDetailScreenModel({
    this.statusCode,
    this.data,
  });

  int? statusCode;
  Data? data;

  factory UniversalDetailScreenModel.fromJson(Map<String, dynamic> json) => UniversalDetailScreenModel(
    statusCode: json["statusCode"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
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
    this.placeId,
    this.attractionId,
    this.name,
    this.description,
    this.openingHrs,
    this.closingHrs,
    this.closingDays,
    this.menuLinks,
    this.knownFor,
    this.seniorCetizenCompatibility,
    this.petsAllowed,
    this.restroomAvailability,
    this.pureVeg,
    this.offers,
    this.cuisines,
    this.modeOfPayment,
    this.modeOfBooking,
    this.extras,
    this.thingsToDo,
    this.rating,
    this.extraInfo,
    this.reviewLinks,
    this.bestTimeToVisit,
    this.mustDo,
    this.startDate,
    this.endDate,
    this.startingHrs,
    this.endingHrs,
    this.type,
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
  String? openingHrs;
  String? closingHrs;
  List<dynamic>? closingDays;
  List<dynamic>? menuLinks;
  List<dynamic>? knownFor;
  bool? seniorCetizenCompatibility;
  bool? petsAllowed;
  bool? restroomAvailability;
  bool? pureVeg;
  List<dynamic>? offers;
  List<dynamic>? cuisines;
  List<dynamic>? modeOfPayment;
  List<dynamic>? modeOfBooking;
  List<dynamic>? extras;
  List<String>? thingsToDo;
  double? rating;
  List<dynamic>? extraInfo;
  List<dynamic>? reviewLinks;
  String? bestTimeToVisit;
  List<dynamic>? mustDo;
  String? startDate;
  String? endDate;
  String? startingHrs;
  String? endingHrs;
  String? type;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
    videos: json["videos"] == null ? [] : List<dynamic>.from(json["videos"]!.map((x) => x)),
    testimonials: json["testimonials"] == null ? [] : List<dynamic>.from(json["testimonials"]!.map((x) => x)),
    category: json["category"] == null ? [] : List<dynamic>.from(json["category"]!.map((x) => x)),
    coordinates: json["coordinates"] == null ? null : Coordinates.fromJson(json["coordinates"]),
    placeId: json["placeId"],
    attractionId: json["attractionId"],
    name: json["name"],
    description: json["description"],
    openingHrs: json["openingHrs"],
    closingHrs: json["closingHrs"],
    closingDays: json["closingDays"] == null ? [] : List<dynamic>.from(json["closingDays"]!.map((x) => x)),
    menuLinks: json["menuLinks"] == null ? [] : List<dynamic>.from(json["menuLinks"]!.map((x) => x)),
    knownFor: json["knownFor"] == null ? [] : List<dynamic>.from(json["knownFor"]!.map((x) => x)),
    seniorCetizenCompatibility: json["seniorCetizenCompatibility"],
    petsAllowed: json["petsAllowed"],
    restroomAvailability: json["restroomAvailability"],
    pureVeg: json["pureVeg"],
    offers: json["offers"] == null ? [] : List<dynamic>.from(json["offers"]!.map((x) => x)),
    cuisines: json["cuisines"] == null ? [] : List<dynamic>.from(json["cuisines"]!.map((x) => x)),
    modeOfPayment: json["modeOfPayment"] == null ? [] : List<dynamic>.from(json["modeOfPayment"]!.map((x) => x)),
    modeOfBooking: json["modeOfBooking"] == null ? [] : List<dynamic>.from(json["modeOfBooking"]!.map((x) => x)),
    extras: json["extras"] == null ? [] : List<dynamic>.from(json["extras"]!.map((x) => x)),
    thingsToDo: json["thingsToDo"] == null ? [] : List<String>.from(json["thingsToDo"]!.map((x) => x)),
    rating: json["rating"]?.toDouble(),
    extraInfo: json["extraInfo"] == null ? [] : List<dynamic>.from(json["extraInfo"]!.map((x) => x)),
    reviewLinks: json["reviewLinks"] == null ? [] : List<dynamic>.from(json["reviewLinks"]!.map((x) => x)),
    bestTimeToVisit: json["bestTimeToVisit"],
    mustDo: json["mustDo"] == null ? [] : List<dynamic>.from(json["mustDo"]!.map((x) => x)),
    startDate: json["startDate"],
    endDate: json["endDate"],
    startingHrs: json["startingHrs"],
    endingHrs: json["endingHrs"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
    "videos": videos == null ? [] : List<dynamic>.from(videos!.map((x) => x)),
    "testimonials": testimonials == null ? [] : List<dynamic>.from(testimonials!.map((x) => x)),
    "category": category == null ? [] : List<dynamic>.from(category!.map((x) => x)),
    "coordinates": coordinates?.toJson(),
    "placeId": placeId,
    "attractionId": attractionId,
    "name": name,
    "description": description,
    "openingHrs": openingHrs,
    "closingHrs": closingHrs,
    "closingDays": closingDays == null ? [] : List<dynamic>.from(closingDays!.map((x) => x)),
    "menuLinks": menuLinks == null ? [] : List<dynamic>.from(menuLinks!.map((x) => x)),
    "knownFor": knownFor == null ? [] : List<dynamic>.from(knownFor!.map((x) => x)),
    "seniorCetizenCompatibility": seniorCetizenCompatibility,
    "petsAllowed": petsAllowed,
    "restroomAvailability": restroomAvailability,
    "pureVeg": pureVeg,
    "offers": offers == null ? [] : List<dynamic>.from(offers!.map((x) => x)),
    "cuisines": cuisines == null ? [] : List<dynamic>.from(cuisines!.map((x) => x)),
    "modeOfPayment": modeOfPayment == null ? [] : List<dynamic>.from(modeOfPayment!.map((x) => x)),
    "modeOfBooking": modeOfBooking == null ? [] : List<dynamic>.from(modeOfBooking!.map((x) => x)),
    "extras": extras == null ? [] : List<dynamic>.from(extras!.map((x) => x)),
    "thingsToDo": thingsToDo == null ? [] : List<dynamic>.from(thingsToDo!.map((x) => x)),
    "rating": rating,
    "extraInfo": extraInfo == null ? [] : List<dynamic>.from(extraInfo!.map((x) => x)),
    "reviewLinks": reviewLinks == null ? [] : List<dynamic>.from(reviewLinks!.map((x) => x)),
    "bestTimeToVisit": bestTimeToVisit,
    "mustDo": mustDo == null ? [] : List<dynamic>.from(mustDo!.map((x) => x)),
    "startDate": startDate,
    "endDate": endDate,
    "startingHrs": startingHrs,
    "endingHrs": endingHrs,
    "type": type,
  };
}

class Coordinates {
  Coordinates({
    this.type,
    this.coordinates,
    this.id,
  });

  String? type;
  List<double>? coordinates;
  String? id;

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
    type: json["type"],
    coordinates: json["coordinates"] == null ? [] : List<double>.from(json["coordinates"]!.map((x) => x?.toDouble())),
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "coordinates": coordinates == null ? [] : List<dynamic>.from(coordinates!.map((x) => x)),
    "_id": id,
  };
}
