// To parse this JSON data, do
//
//     final productStatusChangeModel = productStatusChangeModelFromJson(jsonString);

import 'dart:convert';

ProductStatusChangeModel productStatusChangeModelFromJson(String str) => ProductStatusChangeModel.fromJson(json.decode(str));

String productStatusChangeModelToJson(ProductStatusChangeModel data) => json.encode(data.toJson());

class ProductStatusChangeModel {
  List<Datum>? data;

  ProductStatusChangeModel({
     this.data,
  });

  factory ProductStatusChangeModel.fromJson(Map<String, dynamic> json) => ProductStatusChangeModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int productId;
  String productName;
  String productQuantity;
  String productPrice;
  int status;

  Datum({
    required this.productId,
    required this.productName,
    required this.productQuantity,
    required this.productPrice,
    required this.status,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    productId: json["product_id"],
    productName: json["product_name"],
    productQuantity: json["product_quantity"],
    productPrice: json["product_price"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "product_name": productName,
    "product_quantity": productQuantity,
    "product_price": productPrice,
    "status": status,
  };
}
