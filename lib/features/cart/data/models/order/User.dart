class User {
  User({
      this.id, 
      this.name, 
      this.email, 
      this.phone,});

  User.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
  }
  String? id;
  String? name;
  String? email;
  String? phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    return map;
  }

}