import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../models/banner_model.dart';

import '../../../repository/banners/banner_repository.dart';
part 'banners_event.dart';
part 'banners_state.dart';

class BannersBloc extends Bloc<BannersEvent, BannersState> {
  BannersBloc() : super(BannersInitial()) {
    on<GetBannersEvent>(
      (event, emit) async {
        emit(LoadingBannersState());
        Either<bool, List<BannerModel>> either;
        BannnerRepository bannerRepository = BannnerRepository();
        either = await bannerRepository.getallbanners();

        either.fold((l) => emit(ErrorBannersState()),
            (r) => emit(LoadedBannersState(banners: r)));
      },
    );
  }
}
