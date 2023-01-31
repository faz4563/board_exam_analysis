// To parse this JSON data, do
//
//     final formSubmissionModel = formSubmissionModelFromJson(jsonString);

import 'dart:convert';

FormSubmissionModel formSubmissionModelFromJson(String str) =>
    FormSubmissionModel.fromJson(json.decode(str));

String formSubmissionModelToJson(FormSubmissionModel data) =>
    json.encode(data.toJson());

class FormSubmissionModel {
  FormSubmissionModel({
    required this.randKey,
    required this.schName,
    required this.street,
    required this.city,
    required this.state,
    required this.pincode,
    required this.location,
    required this.name,
    required this.mobileNo,
    required this.email,
    required this.image,
  });

  String randKey;
  String schName;
  String street;
  String city;
  String state;
  String pincode;
  String location;
  String name;
  String mobileNo;
  String email;
  String image;

  factory FormSubmissionModel.fromJson(Map<String, dynamic> json) =>
      FormSubmissionModel(
        randKey: json["rand_key"],
        schName: json["sch_name"],
        street: json["street"],
        city: json["city"],
        state: json["state"],
        pincode: json["pincode"],
        location: json["location"],
        name: json["name"],
        mobileNo: json["mobile_no"],
        email: json["email"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "rand_key": randKey,
        "sch_name": schName,
        "street": street,
        "city": city,
        "state": state,
        "pincode": pincode,
        "location": location,
        "name": name,
        "mobile_no": mobileNo,
        "email": email,
        "image": image,
      };
}
