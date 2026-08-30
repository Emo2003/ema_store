import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../features/auth/data/models/User.dart';


class StorageService {
  static String? token;
  static String? role;
  static User? user;

  static const _storage = FlutterSecureStorage(aOptions: AndroidOptions());

  static Future<void> saveToken(String value) {
    token = value;
    return _storage.write(key: 'token', value: value);
  }

  static Future<String?> getToken() async {
    final value = await _storage.read(key: 'token');
    token = value;
    return value;
  }
  static Future<void> saveUser(User value) async {
    user = value;
    final jsonString = jsonEncode(value.toJson());
    await _storage.write(key: 'user', value: jsonString);
  }

  static Future<User?> getUser() async {
    final jsonString = await _storage.read(key: 'user');
    if (jsonString == null) return null;

    final userMap = jsonDecode(jsonString) as Map<String, dynamic>;
    final userData = User.fromJson(userMap);
    user = userData;
    return userData;
  }

  static Future<void> clearAll() async {
    token = null;
    user = null;
    role = null;
    await _storage.deleteAll();
  }
}
