// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

part of 'user_bloc.dart';

@immutable
abstract class UserState {}

 class UserInitial extends UserState {}

class UpdateUserDataLoadingState extends UserState {}

class UpdateUserDataSuccessState extends UserState {}

class UpdateUserDataWithFailureState extends UserState {
  String error;

  UpdateUserDataWithFailureState(this.error);
}

class GetUserDataSuccessState extends UserState {
  UserModel userModel;
  GetUserDataSuccessState({
    required this.userModel,
  });
}

class GetUserDataLoadingState extends UserState {}

class FailedToGetUserDataState extends UserState {
  String error;
  FailedToGetUserDataState({required this.error});
}
class ChangePasswordLoadingState extends UserState {}

class ChangePasswordSuccessState extends UserState {}

class ChangePasswordWithFailureState extends UserState {
  String error;

  ChangePasswordWithFailureState(this.error);
}