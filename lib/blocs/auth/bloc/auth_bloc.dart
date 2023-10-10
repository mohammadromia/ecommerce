import 'package:e_commerce/repository/auth/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});

    on<LogInEvent>(
      (event, emit) async {
        emit(LoginLoadingState());
        try {
          Map data = {
            'email': event.email,
            'password': event.password,
          };

          AuthRepository authRepository = AuthRepository();
          if (await authRepository.login(data)) {
            emit(LoginSuccessState());
          } else {
            emit(const FailedToLoginState(message: 'error'));
          }
        } catch (e) {
          emit(FailedToLoginState(message: e.toString()));
        }
      },
    );
    on<SignUpEvent>(
      (event, emit) async {
        emit(RegisterLoadingState());
        try {
          Map data = {
            'name': event.name,
            'email': event.email,
            'password': event.password,
            'phone': event.phone,
            'image': "imageurl"
          };

          AuthRepository authRepository = AuthRepository();

          if (await authRepository.signup(data)) {
            emit(RegisterSuccessState());
          } else {
            emit(const FailedToRegisterState(message: 'error'));
          }
        } catch (e) {
          emit(FailedToRegisterState(message: e.toString()));
        }
      },
    );
  }
}
