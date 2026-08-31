import 'package:dio/dio.dart';
import 'package:ema_store/core/services/network_service.dart';
import 'package:ema_store/features/profile/data/data_sources/profile_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProfileDataSource)
class ProfileDataSourceImp implements ProfileDataSource {
  NetworkService networkService;

  ProfileDataSourceImp(this.networkService);

  @override
  Future<Response<dynamic>> addAddress({
    required String name,
    required String city,
    required String details,
    required String phone,
  }) {
    return networkService.dio.post(
      "v1/addresses",
      data: {"name": name, "city": city, "details": details, "phone": phone},
    );
  }

  @override
  Future<Response<dynamic>> getAddresses() {
    return networkService.dio.get("v1/addresses");
  }

  @override
  Future<Response<dynamic>> removeAddress({required String addressId}) {
    return networkService.dio.delete("v1/addresses/$addressId");
  }

  @override
  Future<Response<dynamic>> updateProfile({
    required String name,
    required String email,
    required String phone,
  }) {
    return networkService.dio.put(
      "v1/users/updateMe/",
      data: {"name": name, "email": email, "phone": phone},
    );
  }
}
