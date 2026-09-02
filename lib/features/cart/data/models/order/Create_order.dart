import 'User.dart';
import 'Pricing.dart';
import 'Data.dart';

class CreateOrder {
  CreateOrder({
      this.status, 
      this.message, 
      this.user, 
      this.pricing, 
      this.data,});

  CreateOrder.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    pricing = json['pricing'] != null ? Pricing.fromJson(json['pricing']) : null;
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? status;
  String? message;
  User? user;
  Pricing? pricing;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (pricing != null) {
      map['pricing'] = pricing?.toJson();
    }
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}