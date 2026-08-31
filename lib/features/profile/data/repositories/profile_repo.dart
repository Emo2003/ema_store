import 'package:ema_store/features/profile/data/models/Address.dart';
import 'package:ema_store/features/profile/data/models/Data.dart';

import '../../../auth/data/models/User.dart';

abstract class ProfileRepo {
  Future<Address>addAddress({
    required String name,
    required String city,
    required String details,
    required String phone,
  });
  Future<List<Data>>getAddresses();
  Future<Address>removeAddress({
    required String addressId,
  });
  Future<User>updateProfile({
    required String name,
    required String email,
    required String phone,
  });
}