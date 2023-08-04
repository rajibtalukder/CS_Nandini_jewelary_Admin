// To parse this JSON data, do
//
//     final infoModel = infoModelFromJson(jsonString);

import 'dart:convert';

InfoModel infoModelFromJson(String str) => InfoModel.fromJson(json.decode(str));

String infoModelToJson(InfoModel data) => json.encode(data.toJson());

class InfoModel {
  List<Datum>? data;

  InfoModel({
     this.data,
  });

  factory InfoModel.fromJson(Map<String, dynamic> json) => InfoModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int id;
  String message;
  String whatsapp;
  String phone;

  Datum({
    required this.id,
    required this.message,
    required this.whatsapp,
    required this.phone,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    message: json["message"],
    whatsapp: json["whatsapp"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "message": message,
    "whatsapp": whatsapp,
    "phone": phone,
  };
}
