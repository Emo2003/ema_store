class Pricing {
  Pricing({
      this.cartPrice, 
      this.taxPrice, 
      this.shippingPrice, 
      this.totalOrderPrice,});

  Pricing.fromJson(dynamic json) {
    cartPrice = json['cartPrice'];
    taxPrice = json['taxPrice'];
    shippingPrice = json['shippingPrice'];
    totalOrderPrice = json['totalOrderPrice'];
  }
  num? cartPrice;
  num? taxPrice;
  num? shippingPrice;
  num? totalOrderPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cartPrice'] = cartPrice;
    map['taxPrice'] = taxPrice;
    map['shippingPrice'] = shippingPrice;
    map['totalOrderPrice'] = totalOrderPrice;
    return map;
  }

}