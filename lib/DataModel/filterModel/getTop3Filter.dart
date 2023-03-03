// To parse this JSON data, do
//
//     final getTop3Filter = getTop3FilterFromJson(jsonString);

import 'dart:convert';

GetTop3Filter? getTop3FilterFromJson(String str) => GetTop3Filter.fromJson(json.decode(str));

String getTop3FilterToJson(GetTop3Filter? data) => json.encode(data!.toJson());

class GetTop3Filter {
  GetTop3Filter({
    this.limit,
    this.page,
    this.sort,
  });

  int? limit;
  int? page;
  Sort? sort;

  factory GetTop3Filter.fromJson(Map<String, dynamic> json) => GetTop3Filter(
    limit: json["limit"],
    page: json["page"],
    sort: json["sort"],
  );

  Map<String, dynamic> toJson() => {
    "limit": limit,
    "page": page,
    "sort": sort,
  };
}

class Sort {
  Sort({
    this.rating,
  });

  int? rating;

  factory Sort.fromJson(Map<String, dynamic> json) => Sort(
    rating: json["rating"],
  );

  Map<String, dynamic> toJson() => {
    "rating": rating,
  };
}
