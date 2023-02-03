// To parse this JSON data, do
//
//     final fileUploadModel = fileUploadModelFromJson(jsonString);

import 'dart:convert';

FileUploadModel fileUploadModelFromJson(String str) =>
    FileUploadModel.fromJson(json.decode(str));

String fileUploadModelToJson(FileUploadModel data) =>
    json.encode(data.toJson());

class FileUploadModel {
  FileUploadModel({
    this.s,
    this.d,
    this.f,
  });

  bool? s;
  D? d;
  String? f;

  factory FileUploadModel.fromJson(Map<String, dynamic> json) =>
      FileUploadModel(
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
    required this.rurl,
    required this.fullurl,
  });

  String rurl;
  String fullurl;

  factory D.fromJson(Map<String, dynamic> json) => D(
        rurl: json["Rurl"],
        fullurl: json["fullurl"],
      );

  Map<String, dynamic> toJson() => {
        "Rurl": rurl,
        "fullurl": fullurl,
      };
}
