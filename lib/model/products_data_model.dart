// To parse this JSON data, do
//
//     final productsDataModel = productsDataModelFromJson(jsonString);

import 'dart:convert';

ProductsDataModel productsDataModelFromJson(String str) => ProductsDataModel.fromJson(json.decode(str));

String productsDataModelToJson(ProductsDataModel data) => json.encode(data.toJson());

class ProductsDataModel {
  List<Datum>? data;

  ProductsDataModel({
     this.data,
  });

  factory ProductsDataModel.fromJson(Map<String, dynamic> json) => ProductsDataModel(
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
