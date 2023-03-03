// To parse this JSON data, do
//
//     final visitRecommend = visitRecommendFromJson(jsonString);

import 'dart:convert';

VisitRecommend visitRecommendFromJson(String str) =>
    VisitRecommend.fromJson(json.decode(str));

String visitRecommendToJson(VisitRecommend data) => json.encode(data.toJson());

class VisitRecommend {
  VisitRecommend({
    this.data,
  });

  Map<String, List<Map<String, Data>>>? data;

  factory VisitRecommend.fromJson(Map<String, dynamic> json) => VisitRecommend(
        data: Map.from(json["data"]!).map((k, v) =>
            MapEntry<String, List<Map<String, Data>>>(
                k,
                List<Map<String, Data>>.from(v.map((x) => Map.from(x).map(
                    (k, v) => MapEntry<String, Data>(k, Data.fromJson(v))))))),
      );

  Map<String, dynamic> toJson() => {
        "data": Map.from(data!).map((k, v) => MapEntry<String, dynamic>(
            k,
            List<dynamic>.from(v.map((x) => Map.from(x)
                .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())))))),
      };
}

class Data {
  Data({
    this.attractions,
    this.foodplaces,
    this.events,
    this.recreationalActivities,
  });

  List<dynamic>? attractions;
  List<dynamic>? foodplaces;
  List<dynamic>? events;
  List<dynamic>? recreationalActivities;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        attractions: json["attractions"] == null
            ? []
            : List<dynamic>.from(json["attractions"]!.map((x) => x)),
        foodplaces: json["foodplaces"] == null
            ? []
            : List<dynamic>.from(json["foodplaces"]!.map((x) => x)),
        events: json["events"] == null
            ? []
            : List<dynamic>.from(json["events"]!.map((x) => x)),
        recreationalActivities: json["recreationalActivities"] == null
            ? []
            : List<dynamic>.from(json["recreationalActivities"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "attractions": attractions == null
            ? []
            : List<dynamic>.from(attractions!.map((x) => x)),
        "foodplaces": foodplaces == null
            ? []
            : List<dynamic>.from(foodplaces!.map((x) => x)),
        "events":
            events == null ? [] : List<dynamic>.from(events!.map((x) => x)),
        "recreationalActivities": recreationalActivities == null
            ? []
            : List<dynamic>.from(recreationalActivities!.map((x) => x)),
      };
}
