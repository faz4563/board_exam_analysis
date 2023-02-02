// To parse this JSON data, do
//
//     final pdfModel = pdfModelFromJson(jsonString);

import 'dart:convert';

PdfModel pdfModelFromJson(String str) => PdfModel.fromJson(json.decode(str));

String pdfModelToJson(PdfModel data) => json.encode(data.toJson());

class PdfModel {
  PdfModel({
    this.s,
    this.d,
    this.f,
  });

  bool? s;
  D? d;
  String? f;

  factory PdfModel.fromJson(Map<String, dynamic> json) => PdfModel(
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
