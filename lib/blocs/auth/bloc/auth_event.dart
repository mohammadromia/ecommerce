// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LogInEvent extends AuthEvent {
  String email;
  String password;
  LogInEvent({
    required this.email,
    required this.password,
  });
}

class SignUpEvent extends AuthEvent {
  String name;
  String phone;
  String email;
  String password;
  SignUpEvent({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
  });
}
