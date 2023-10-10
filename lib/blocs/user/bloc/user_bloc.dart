import 'package:dartz/dartz.dart';
import 'package:e_commerce/repository/user/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../models/user_model.dart';
import '../../../core/constants/constants.dart';
import '../../../core/network/localnetwork.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) {});

    on<GetUserDataEvent>((event, emit) async {
      emit(GetUserDataLoadingState());

      Either<bool, UserModel> either;
      UserRepository userRepository = UserRepository();
      either = await userRepository.getinfouser();

      either.fold((l) => emit(FailedToGetUserDataState(error: 'error')),
          (r) => emit(GetUserDataSuccessState(userModel: r)));
    });
    on<UpDateUserDataEvent>((event, emit) async {
      emit(UpdateUserDataLoadingState());
      try {
        Map data = {
          'name': event.name,
          'email': event.email,
          'phone': event.phone
        };
        UserRepository userRepository = UserRepository();

        if (await userRepository.updateuserdata(data)) {
          emit(UpdateUserDataSuccessState());
        } else {
          emit(UpdateUserDataWithFailureState('error'));
        }
      } catch (e) {
        emit(UpdateUserDataWithFailureState(e.toString()));
      }
    });

    on<ChangePasswordEvent>(
      (event, emit) async {
        emit(ChangePasswordLoadingState());

        Map data = {
          'current_password': event.userCurrentPassword,
          'new_password': event.newPassword,
        };
        UserRepository userRepository = UserRepository();

        if (await userRepository.changepassword(data)) {
          await CacheNetwork.insertToCache(
              key: 'password', value: event.newPassword);
          currentPassword = await CacheNetwork.getCacheData(key: "password");
          emit(ChangePasswordSuccessState());
        } else {
          emit(ChangePasswordWithFailureState('error'));
        }
        {
          emit(ChangePasswordWithFailureState(
              "something went wrong, try again later"));
        }
      },
    );
  }
}
