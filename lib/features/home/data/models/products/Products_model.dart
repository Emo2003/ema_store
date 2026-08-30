import 'Metadata.dart';
import 'Products.dart';

class ProductsModel {
  ProductsModel({
      this.results, 
      this.metadata, 
      this.products,});

  ProductsModel.fromJson(dynamic json) {
    results = json['results'];
    metadata = json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      products = [];
      json['data'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
  }
  num? results;
  Metadata? metadata;
  List<Products>? products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['results'] = results;
    if (metadata != null) {
      map['metadata'] = metadata?.toJson();
    }
    if (products != null) {
      map['data'] = products?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}