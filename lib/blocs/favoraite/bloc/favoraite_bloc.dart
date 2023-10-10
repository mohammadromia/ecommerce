
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../models/product_model.dart';

import '../../../repository/favoraite/favoraite_repository.dart';

part 'favoraite_event.dart';
part 'favoraite_state.dart';

class FavoraiteBloc extends Bloc<FavoraiteEvent, FavoraiteState> {
  FavoraiteBloc() : super(FavoraiteInitial()) {
    on<GetFavoriteEvent>((event, emit) async {
      emit(LoadingFavoraiteState());
      Either<bool, List<ProductModel>> either;
      FavoraiteRepository favoriateRepository = FavoraiteRepository();
      either = await favoriateRepository.getproductfavoraite();

      either.fold((l) => emit(FaliureFavoraiteState()),
          (r) => emit(LoadedFavoraiteState(favorites: r)));
    });

    on<AddfavoraiteEvent>((event, emit) async {
      Map data = {"product_id": event.pm.id.toString()};
      FavoraiteRepository favoriateRepository = FavoraiteRepository();

      if (await favoriateRepository.addandremoveproductfavoraite(data)) {
        if ((state as LoadedFavoraiteState).favorites.contains(event.pm)) {
          LoadedFavoraiteState(
            favorites: List.from(
                (state as LoadedFavoraiteState).favorites..remove(event.pm)),
          );
        } else {
          LoadedFavoraiteState(
            favorites: List.from(
                (state as LoadedFavoraiteState).favorites..add(event.pm)),
          );
        }
      }
    });
  }
}
