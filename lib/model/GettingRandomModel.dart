// To parse this JSON data, do
//
//     final getRandomKeyModel = getRandomKeyModelFromJson(jsonString);

import 'dart:convert';

GetRandomKeyModel getRandomKeyModelFromJson(String str) =>
    GetRandomKeyModel.fromJson(json.decode(str));

String getRandomKeyModelToJson(GetRandomKeyModel data) =>
    json.encode(data.toJson());

class GetRandomKeyModel {
  GetRandomKeyModel({
    this.s,
    this.d,
    this.f,
  });

  bool? s;
  D? d;
  String? f;

  factory GetRandomKeyModel.fromJson(Map<String, dynamic> json) =>
      GetRandomKeyModel(
        s: json["S"],
        d: D.fromJson(json["D"]),
        f: json["F"],
      );

  Map<String, dynamic> toJson() => {
        "S": s,
        "D": d!.toJson(),
        "F": f,
      };
}

class D {
  D({
    required this.data,
  });

  String data;

  factory D.fromJson(Map<String, dynamic> json) => D(
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
      };
}
