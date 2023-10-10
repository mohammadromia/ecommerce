part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();
  
  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

class RegisterLoadingState extends AuthState{}
class RegisterSuccessState extends AuthState{}
class FailedToRegisterState extends AuthState{
  final String message;
  const FailedToRegisterState({required this.message});
}

class LoginLoadingState extends AuthState{}
class LoginSuccessState extends AuthState{}
class FailedToLoginState extends AuthState{
  final String message;
  const FailedToLoginState({required this.message});
}