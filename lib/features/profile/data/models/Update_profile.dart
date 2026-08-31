import '../../../auth/data/models/User.dart';

class UpdateProfile {
  UpdateProfile({
      this.message, 
      this.user,});

  UpdateProfile.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? message;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}