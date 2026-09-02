class ShippingAddress {
  ShippingAddress({
      this.details, 
      this.phone, 
      this.city,});

  ShippingAddress.fromJson(dynamic json) {
    details = json['details'];
    phone = json['phone'];
    city = json['city'];
  }
  String? details;
  String? phone;
  String? city;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['details'] = details;
    map['phone'] = phone;
    map['city'] = city;
    return map;
  }

}