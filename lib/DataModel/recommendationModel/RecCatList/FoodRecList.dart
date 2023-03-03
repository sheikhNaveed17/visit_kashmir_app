// To parse this JSON data, do
//
//     final foodRecList = foodRecListFromJson(jsonString);

import 'dart:convert';

List<FoodRecList> foodRecListFromJson(String str) => List<FoodRecList>.from(json.decode(str).map((x) => FoodRecList.fromJson(x)));

String foodRecListToJson(List<FoodRecList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FoodRecList {
  FoodRecList({
    this.id,
    this.images,
    this.videos,
    this.testimonials,
    this.category,
    this.coordinates,
    this.placeId,
    this.name,
    this.description,
    this.openingHrs,
    this.closingHrs,
    this.closingDays,
    this.menuLinks,
    this.knownFor,
    this.restroomAvailability,
    this.offers,
    this.cuisines,
    this.modeOfPayment,
    this.modeOfBooking,
    this.extras,
    this.startSlot,
    this.endSlot,
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
  String? openingHrs;
  String? closingHrs;
  List<dynamic>? closingDays;
  List<dynamic>? menuLinks;
  List<String>? knownFor;
  bool? restroomAvailability;
  List<dynamic>? offers;
  List<dynamic>? cuisines;
  List<dynamic>? modeOfPayment;
  List<String>? modeOfBooking;
  List<dynamic>? extras;
  String? startSlot;
  String? endSlot;

  factory FoodRecList.fromJson(Map<String, dynamic> json) => FoodRecList(
    id: json["_id"],
    images: json["images"] == null ? [] : List<dynamic>.from(json["images"]!.map((x) => x)),
    videos: json["videos"] == null ? [] : List<dynamic>.from(json["videos"]!.map((x) => x)),
    testimonials: json["testimonials"] == null ? [] : List<dynamic>.from(json["testimonials"]!.map((x) => x)),
    category: json["category"] == null ? [] : List<String>.from(json["category"]!.map((x) => x)),
    coordinates: json["coordinates"] == null ? null : Coordinates.fromJson(json["coordinates"]),
    placeId: json["placeId"],
    name: json["name"],
    description: json["description"],
    openingHrs: json["openingHrs"],
    closingHrs: json["closingHrs"],
    closingDays: json["closingDays"] == null ? [] : List<dynamic>.from(json["closingDays"]!.map((x) => x)),
    menuLinks: json["menuLinks"] == null ? [] : List<dynamic>.from(json["menuLinks"]!.map((x) => x)),
    knownFor: json["knownFor"] == null ? [] : List<String>.from(json["knownFor"]!.map((x) => x)),
    restroomAvailability: json["restroomAvailability"],
    offers: json["offers"] == null ? [] : List<dynamic>.from(json["offers"]!.map((x) => x)),
    cuisines: json["cuisines"] == null ? [] : List<dynamic>.from(json["cuisines"]!.map((x) => x)),
    modeOfPayment: json["modeOfPayment"] == null ? [] : List<dynamic>.from(json["modeOfPayment"]!.map((x) => x)),
    modeOfBooking: json["modeOfBooking"] == null ? [] : List<String>.from(json["modeOfBooking"]!.map((x) => x)),
    extras: json["extras"] == null ? [] : List<dynamic>.from(json["extras"]!.map((x) => x)),
    startSlot: json["startSlot"],
    endSlot: json["endSlot"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
    "videos": videos == null ? [] : List<dynamic>.from(videos!.map((x) => x)),
    "testimonials": testimonials == null ? [] : List<dynamic>.from(testimonials!.map((x) => x)),
    "category": category == null ? [] : List<dynamic>.from(category!.map((x) => x)),
    "coordinates": coordinates?.toJson(),
    "placeId": placeId,
    "name": name,
    "description": description,
    "openingHrs": openingHrs,
    "closingHrs": closingHrs,
    "closingDays": closingDays == null ? [] : List<dynamic>.from(closingDays!.map((x) => x)),
    "menuLinks": menuLinks == null ? [] : List<dynamic>.from(menuLinks!.map((x) => x)),
    "knownFor": knownFor == null ? [] : List<dynamic>.from(knownFor!.map((x) => x)),
    "restroomAvailability": restroomAvailability,
    "offers": offers == null ? [] : List<dynamic>.from(offers!.map((x) => x)),
    "cuisines": cuisines == null ? [] : List<dynamic>.from(cuisines!.map((x) => x)),
    "modeOfPayment": modeOfPayment == null ? [] : List<dynamic>.from(modeOfPayment!.map((x) => x)),
    "modeOfBooking": modeOfBooking == null ? [] : List<dynamic>.from(modeOfBooking!.map((x) => x)),
    "extras": extras == null ? [] : List<dynamic>.from(extras!.map((x) => x)),
    "startSlot": startSlot,
    "endSlot": endSlot,
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
