import 'ShippingAddress.dart';
import 'User.dart';
import 'CartItems.dart';

class Data {
  Data({
      this.shippingAddress, 
      this.taxPrice, 
      this.shippingPrice, 
      this.totalOrderPrice, 
      this.paymentMethodType, 
      this.isPaid, 
      this.isDelivered, 
      this.id, 
      this.user, 
      this.cartItems, 
      this.createdAt, 
      this.updatedAt,
      this.v,});

  Data.fromJson(dynamic json) {
    shippingAddress = json['shippingAddress'] != null ? ShippingAddress.fromJson(json['shippingAddress']) : null;
    taxPrice = json['taxPrice'];
    shippingPrice = json['shippingPrice'];
    totalOrderPrice = json['totalOrderPrice'];
    paymentMethodType = json['paymentMethodType'];
    isPaid = json['isPaid'];
    isDelivered = json['isDelivered'];
    id = json['_id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['cartItems'] != null) {
      cartItems = [];
      json['cartItems'].forEach((v) {
        cartItems?.add(CartItems.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  ShippingAddress? shippingAddress;
  num? taxPrice;
  num? shippingPrice;
  num? totalOrderPrice;
  String? paymentMethodType;
  bool? isPaid;
  bool? isDelivered;
  String? id;
  User? user;
  List<CartItems>? cartItems;
  String? createdAt;
  String? updatedAt;
  num? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (shippingAddress != null) {
      map['shippingAddress'] = shippingAddress?.toJson();
    }
    map['taxPrice'] = taxPrice;
    map['shippingPrice'] = shippingPrice;
    map['totalOrderPrice'] = totalOrderPrice;
    map['paymentMethodType'] = paymentMethodType;
    map['isPaid'] = isPaid;
    map['isDelivered'] = isDelivered;
    map['_id'] = id;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (cartItems != null) {
      map['cartItems'] = cartItems?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

}