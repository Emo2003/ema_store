import 'package:dio/dio.dart';
import 'package:ema_store/features/profile/data/data_sources/profile_data_source.dart';
import 'package:ema_store/features/profile/data/models/Address.dart';
import 'package:ema_store/features/profile/data/models/Data.dart';
import 'package:ema_store/features/profile/data/repositories/profile_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error_handling/failure.dart';
import '../../../auth/data/models/User.dart';

@Injectable(as: ProfileRepo)
class ProfileRepoImp implements ProfileRepo {
  final ProfileDataSource dataSource;

  const ProfileRepoImp(this.dataSource);

  @override
  Future<Address> addAddress({
    required String name,
    required String city,
    required String details,
    required String phone,
  }) async {
    try {
      final res = await dataSource.addAddress(
        name: name,
        city: city,
        details: details,
        phone: phone,
      );

      return Address.fromJson(res.data);
    } on DioException catch (e) {
      throw ServerFailure.fromDioError(e).message;
    } catch (e) {
      throw 'An unexpected error occurred. Please try again.';
    }

  }

  @override
  Future<List<Data>> getAddresses() async {
    try {
      final res = await dataSource.getAddresses();

      final address = Address.fromJson(res.data);

      return address.data ?? [];
    } on DioException catch (e) {
      throw ServerFailure.fromDioError(e).message;
    } catch (e) {
      throw 'An unexpected error occurred. Please try again.';
    }
  }

  @override
  Future<Address> removeAddress({required String addressId}) async {
    try {
      final res = await dataSource.removeAddress(addressId: addressId);

      return Address.fromJson(res.data);
    } on DioException catch (e) {
      throw ServerFailure.fromDioError(e).message;
    } catch (e) {
      throw 'An unexpected error occurred. Please try again.';
    }
  }

  @override
  Future<User> updateProfile({
    required String name,
    required String email,
    required String phone,
  }) async {
    try {
      final res = await dataSource.updateProfile(
        name: name,
        email: email,
        phone: phone,
      );

      return User.fromJson(res.data['user']);
    } on DioException catch (e) {
      throw ServerFailure.fromDioError(e).message;
    } catch (e) {
      throw 'An unexpected error occurred. Please try again.';
    }
  }
}
