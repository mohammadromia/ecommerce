
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../models/product_model.dart';

import '../../../repository/cart/favoraite_repository.dart';
part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<GetCartEvent>((event, emit) async {
      emit(LoadingCartState());
      Either<bool, List<ProductModel>> either;
      CartRepository cartRepository = CartRepository();
      either = await cartRepository.getproductcart();

      either.fold(
          (l) => emit(ErrorCartState()),
          (r) => emit(
              LoadedCartState(totalPrice: cartRepository.gettotal, carts: r)));
    });

    on<AddToCartEvent>((event, emit) async {
      Map data = {"product_id": event.pm.id.toString()};
      CartRepository cartRepository = CartRepository();


      if (await cartRepository.addandremoveproductcart(data)) {
        if ((state as LoadedCartState).carts.contains(event.pm)) {
          emit(LoadedCartState(
              carts: (state as LoadedCartState).carts..remove(event.pm),
              totalPrice:
                  (state as LoadedCartState).totalPrice - event.pm.price!));
        } else {
          emit(LoadedCartState(
              carts: (state as LoadedCartState).carts..add(event.pm),
              totalPrice:
                  (state as LoadedCartState).totalPrice + event.pm.price!));
        }
      } else {
      }
    });
  }
}
