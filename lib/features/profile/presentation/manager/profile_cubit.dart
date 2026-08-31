import 'package:ema_store/features/profile/data/repositories/profile_repo.dart';
import 'package:ema_store/features/profile/presentation/manager/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/Data.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  ProfileRepo profileRepo;

  ProfileCubit(this.profileRepo) : super(ProfileInitialState());

  ProfileCubit get(context) => BlocProvider.of(context);
  TextEditingController nameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPhoneController = TextEditingController();

  List<Data> addresses = [];

  Future<void> addAddress() async {
    emit(ProfileAddLoadingState());
    try {
      final res = await profileRepo.addAddress(
        name: nameController.text,
        city: cityController.text,
        details: detailsController.text,
        phone: phoneController.text,
      );
      emit(ProfileAddSuccessState(address: res));
    } catch (e) {
      emit(ProfileAddErrorState(message: e.toString()));
    }
  }

  Future<void> getAddresses() async {
    emit(ProfileGetLoadingState());
    try {
      final res = await profileRepo.getAddresses();
      addresses = res;
      emit(ProfileGetSuccessState(addresses: res));
    } catch (e) {
      emit(ProfileGetErrorState(message: e.toString()));
    }
  }

  Future<void> removeAddress({required String addressId}) async {
    emit(ProfileRemoveLoadingState());

    try {
      final res = await profileRepo.removeAddress(addressId: addressId);

      addresses.removeWhere((address) => '${address.id}' == addressId);

      emit(ProfileRemoveSuccessState(address: res));
    } catch (e) {
      emit(ProfileRemoveErrorState(message: e.toString()));
    }
  }

  Future<void> updateProfile() async {
    emit(ProfileUpdateLoadingState());

    try {
      final res = await profileRepo.updateProfile(
        name: userNameController.text.trim(),
        email: userEmailController.text.trim(),
        phone: userPhoneController.text.trim(),
      );

      emit(ProfileUpdateSuccessState(user: res));
    } catch (e) {
      emit(ProfileUpdateErrorState(message: e.toString()));
    }
  }

  void clearAddressControllers() {
    nameController.clear();
    cityController.clear();
    detailsController.clear();
    phoneController.clear();
  }

  void setUserData({required String name, required String email}) {
    userNameController.text = name;
    userEmailController.text = email;
  }
}
