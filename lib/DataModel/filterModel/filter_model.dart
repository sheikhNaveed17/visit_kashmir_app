// To parse this JSON data, do
//
//     final filterModel = filterModelFromJson(jsonString);

import 'dart:convert';

FilterModel? filterModelFromJson(String str) => FilterModel.fromJson(json.decode(str));

String filterModelToJson(FilterModel? data) => json.encode(data!.toJson());

class FilterModel {
  FilterModel({
    this.limit,
    this.page,
    this.sort,
    this.filter,
  });

  int? limit;
  int? page;
  Sort? sort;
  Filter? filter;

  factory FilterModel.fromJson(Map<String, dynamic> json) => FilterModel(
    limit: json["limit"],
    page: json["page"],
    sort: json["sort"],
    filter: json["filter"],
  );

  Map<String, dynamic> toJson() => {
    "limit": limit,
    "page": page,
    "sort": sort,
    "filter": filter,
  };
}

class Filter {
  Filter({
    this.name,
    this.seniorCetizenCompatibility,
    this.petsAllowed,
    this.restroomAvailability,
    this.pureVeg,
  });

  String? name;
  bool? seniorCetizenCompatibility;
  bool? petsAllowed;
  bool? restroomAvailability;
  bool? pureVeg;

  factory Filter.fromJson(Map<String, dynamic> json) => Filter(
    name: json["name"],
    seniorCetizenCompatibility: json["seniorCetizenCompatibility"],
    petsAllowed: json["petsAllowed"],
    restroomAvailability: json["restroomAvailability"],
    pureVeg: json["pureVeg"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "seniorCetizenCompatibility": seniorCetizenCompatibility,
    "petsAllowed": petsAllowed,
    "restroomAvailability": restroomAvailability,
    "pureVeg": pureVeg,
  };
}

class Sort {
  Sort({
    this.name,
  });

  int? name;

  factory Sort.fromJson(Map<String, dynamic> json) => Sort(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}
