import 'package:dio/dio.dart';

abstract class ProfileDataSource {
  Future<Response>addAddress({
    required String name,
    required String city,
    required String details,
    required String phone,
  });
  Future<Response>getAddresses();
  Future<Response>removeAddress({
    required String addressId,
  });
  Future<Response>updateProfile({
    required String name,
    required String email,
    required String phone,
  });
}