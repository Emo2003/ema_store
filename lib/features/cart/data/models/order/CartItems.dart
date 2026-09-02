import 'Product.dart';

class CartItems {
  CartItems({
      this.count, 
      this.id, 
      this.product, 
      this.price,});

  CartItems.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'] != null ? Product.fromJson(json['product']) : null;
    price = json['price'];
  }
  num? count;
  String? id;
  Product? product;
  num? price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['_id'] = id;
    if (product != null) {
      map['product'] = product?.toJson();
    }
    map['price'] = price;
    return map;
  }

}