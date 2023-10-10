// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class UpDateUserDataEvent extends UserEvent {
  String name;
  String phone;
  String email;
  UpDateUserDataEvent({
    required this.name,
    required this.phone,
    required this.email,
  });
}

class GetUserDataEvent extends UserEvent {}

class ChangePasswordEvent extends UserEvent {
  String userCurrentPassword;
  String newPassword;

  ChangePasswordEvent({
    required this.userCurrentPassword,
    required this.newPassword,
  });
}
