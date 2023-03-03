// To parse this JSON data, do
//
//     final filterGenericSearch = filterGenericSearchFromJson(jsonString);

import 'dart:convert';

FilterGenericSearch? filterGenericSearchFromJson(String str) => FilterGenericSearch.fromJson(json.decode(str));

String filterGenericSearchToJson(FilterGenericSearch? data) => json.encode(data!.toJson());

class FilterGenericSearch {
  FilterGenericSearch({
    this.filter,
    this.limit,
  });

  Filter_search? filter;
  int? limit;

  factory FilterGenericSearch.fromJson(Map<String, dynamic> json) => FilterGenericSearch(
    filter: json["filter"],
    limit: json["limit"],
  );

  Map<String, dynamic> toJson() => {
    "filter": filter,
    "limit": limit,
  };
}

class Filter_search {
  Filter_search({
    this.name,
  });

  String? name;

  factory Filter_search.fromJson(Map<String, dynamic> json) => Filter_search(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}
