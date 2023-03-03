// To parse this JSON data, do
//
//     final the3FoodsModel = the3FoodsModelFromJson(jsonString);

import 'dart:convert';

The3FoodsModel the3FoodsModelFromJson(String str) => The3FoodsModel.fromJson(json.decode(str));

String the3FoodsModelToJson(The3FoodsModel data) => json.encode(data.toJson());

class The3FoodsModel {
  The3FoodsModel({
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

  factory The3FoodsModel.fromJson(Map<String, dynamic> json) => The3FoodsModel(
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
    this.type,
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
  });

  int? id;
  List<dynamic>? images;
  List<dynamic>? videos;
  List<dynamic>? testimonials;
  List<String>? category;
  Coordinates? coordinates;
  int? placeId;
  String? name;
  String? type;
  String? description;
  String? openingHrs;
  String? closingHrs;
  List<String>? closingDays;
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    images: List<dynamic>.from(json["images"].map((x) => x)),
    videos: List<dynamic>.from(json["videos"].map((x) => x)),
    testimonials: List<dynamic>.from(json["testimonials"].map((x) => x)),
    category: List<String>.from(json["category"].map((x) => x)),
    coordinates: Coordinates.fromJson(json["coordinates"]),
    placeId: json["placeId"],
    name: json["name"],
    type: json["type"],
    description: json["description"],
    openingHrs: json["openingHrs"],
    closingHrs: json["closingHrs"],
    closingDays: List<String>.from(json["closingDays"].map((x) => x)),
    menuLinks: List<dynamic>.from(json["menuLinks"].map((x) => x)),
    knownFor: List<dynamic>.from(json["knownFor"].map((x) => x)),
    seniorCetizenCompatibility: json["seniorCetizenCompatibility"],
    petsAllowed: json["petsAllowed"],
    restroomAvailability: json["restroomAvailability"],
    pureVeg: json["pureVeg"],
    offers: List<dynamic>.from(json["offers"].map((x) => x)),
    cuisines: List<dynamic>.from(json["cuisines"].map((x) => x)),
    modeOfPayment: List<dynamic>.from(json["modeOfPayment"].map((x) => x)),
    modeOfBooking: List<dynamic>.from(json["modeOfBooking"].map((x) => x)),
    extras: List<dynamic>.from(json["extras"].map((x) => x)),
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
    "type": type,
    "description": description,
    "openingHrs": openingHrs,
    "closingHrs": closingHrs,
    "closingDays": List<dynamic>.from(closingDays!.map((x) => x)),
    "menuLinks": List<dynamic>.from(menuLinks!.map((x) => x)),
    "knownFor": List<dynamic>.from(knownFor!.map((x) => x)),
    "seniorCetizenCompatibility": seniorCetizenCompatibility,
    "petsAllowed": petsAllowed,
    "restroomAvailability": restroomAvailability,
    "pureVeg": pureVeg,
    "offers": List<dynamic>.from(offers!.map((x) => x)),
    "cuisines": List<dynamic>.from(cuisines!.map((x) => x)),
    "modeOfPayment": List<dynamic>.from(modeOfPayment!.map((x) => x)),
    "modeOfBooking": List<dynamic>.from(modeOfBooking!.map((x) => x)),
    "extras": List<dynamic>.from(extras!.map((x) => x)),
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
