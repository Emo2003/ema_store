import 'Metadata.dart';
import 'brands.dart';

class BrandsModel {
  BrandsModel({
      this.results, 
      this.metadata, 
      this.brands,});

  BrandsModel.fromJson(dynamic json) {
    results = json['results'];
    metadata = json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      brands = [];
      json['data'].forEach((v) {
        brands?.add(Brands.fromJson(v));
      });
    }
  }
  num? results;
  Metadata? metadata;
  List<Brands>? brands;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['results'] = results;
    if (metadata != null) {
      map['metadata'] = metadata?.toJson();
    }
    if (brands != null) {
      map['data'] = brands?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}