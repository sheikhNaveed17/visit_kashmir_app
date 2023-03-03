// To parse this JSON data, do
//
//     final saveRecommendation = saveRecommendationFromJson(jsonString);

import 'dart:convert';

SaveRecommendation saveRecommendationFromJson(String str) => SaveRecommendation.fromJson(json.decode(str));

String saveRecommendationToJson(SaveRecommendation data) => json.encode(data.toJson());

class SaveRecommendation {
  SaveRecommendation({
    this.userId,
    this.userRecommendations,
  });

  int? userId;
  List<UserRecommendation>? userRecommendations;

  factory SaveRecommendation.fromJson(Map<String, dynamic> json) => SaveRecommendation(
    userId: json["userId"],
    userRecommendations: json["userRecommendations"] == null ? [] : List<UserRecommendation>.from(json["userRecommendations"]!.map((x) => UserRecommendation.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "userRecommendations": userRecommendations == null ? [] : List<dynamic>.from(userRecommendations!.map((x) => x.toJson())),
  };
}

class UserRecommendation {
  UserRecommendation({
    this.data,
  });

  Data? data;

  factory UserRecommendation.fromJson(Map<String, dynamic> json) => UserRecommendation(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
  };
}

class Data {
  Data();

  factory Data.fromJson(Map<String, dynamic> json) => Data(
  );

  Map<String, dynamic> toJson() => {
  };
}
