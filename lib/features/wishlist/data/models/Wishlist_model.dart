import 'WishListProducts.dart';

class WishlistModel {
  WishlistModel({
      this.status, 
      this.message, 
      this.count, 
      this.data,});

  WishlistModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    count = json['count'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Wishlistproducts.fromJson(v));
      });
    }
  }
  String? status;
  String? message;
  num? count;
  List<Wishlistproducts>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['count'] = count;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}