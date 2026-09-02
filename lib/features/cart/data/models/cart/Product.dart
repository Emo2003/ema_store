import 'Subcategory.dart';
import 'Category.dart';
import 'Brand.dart';

class Product {
  Product({
      this.subcategory, 
      this.id, 
      this.title, 
      this.slug, 
      this.quantity, 
      this.imageCover, 
      this.category, 
      this.brand, 
      this.ratingsAverage, 
  });

  Product.fromJson(dynamic json) {
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(Subcategory.fromJson(v));
      });
    }
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    quantity = json['quantity'];
    imageCover = json['imageCover'];
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
  }
  List<Subcategory>? subcategory;
  String? id;
  String? title;
  String? slug;
  num? quantity;
  String? imageCover;
  Category? category;
  Brand? brand;
  num? ratingsAverage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (subcategory != null) {
      map['subcategory'] = subcategory?.map((v) => v.toJson()).toList();
    }
    map['_id'] = id;
    map['title'] = title;
    map['slug'] = slug;
    map['quantity'] = quantity;
    map['imageCover'] = imageCover;
    if (category != null) {
      map['category'] = category?.toJson();
    }
    if (brand != null) {
      map['brand'] = brand?.toJson();
    }
    map['ratingsAverage'] = ratingsAverage;
    return map;
  }

}