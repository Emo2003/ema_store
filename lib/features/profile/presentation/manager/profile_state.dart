import '../../../auth/data/models/User.dart';
import '../../data/models/Address.dart';
import '../../data/models/Data.dart';

sealed class ProfileState {}

class ProfileInitialState extends ProfileState {}

//Add Address States
class ProfileAddLoadingState extends ProfileState {}

class ProfileAddSuccessState extends ProfileState {
  final Address address;

  ProfileAddSuccessState({required this.address});
}

class ProfileAddErrorState extends ProfileState {
  final String message;

  ProfileAddErrorState({required this.message});
}

//Get Addresses States
class ProfileGetLoadingState extends ProfileState {}

class ProfileGetSuccessState extends ProfileState {
  final List<Data> addresses;

  ProfileGetSuccessState({required this.addresses});
}

class ProfileGetErrorState extends ProfileState {
  final String message;

  ProfileGetErrorState({required this.message});
}

//Remove Address States
class ProfileRemoveLoadingState extends ProfileState {}

class ProfileRemoveSuccessState extends ProfileState {
  final Address address;

  ProfileRemoveSuccessState({required this.address});
}

class ProfileRemoveErrorState extends ProfileState {
  final String message;

  ProfileRemoveErrorState({required this.message});
}

//Update Profile States
class ProfileUpdateLoadingState extends ProfileState {}

class ProfileUpdateSuccessState extends ProfileState {
  final User user;

  ProfileUpdateSuccessState({required this.user});
}

class ProfileUpdateErrorState extends ProfileState {
  final String message;

  ProfileUpdateErrorState({required this.message});
}
