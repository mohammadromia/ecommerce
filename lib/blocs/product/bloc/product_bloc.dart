import 'package:dartz/dartz.dart';
import 'package:e_commerce/blocs/cart/bloc/cart_bloc.dart';
import 'package:e_commerce/repository/product/product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../models/product_model.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final CartBloc secondBloc;

  ProductBloc(this.secondBloc) : super(ProductInitial()) {
    on<ProductEvent>((event, emit) {});

    on<RefreshEvent>((event, emit) {
      if (state is LoadedProductsSuccessState) {
        int index =
            (state as LoadedProductsSuccessState).products.indexOf(event.pm);
        ProductModel prod =
            (state as LoadedProductsSuccessState).products[index];

        if (event.isfavoraite) {
          (state as LoadedProductsSuccessState).products[index].in_favorites!
              ? {
                  emit(LoadedProductsSuccessState(
                      products: (state as LoadedProductsSuccessState).products
                        ..removeAt(index)
                        ..insert(index, prod.copyWith(in_favorites: false))))
                }
              : {
                  emit(LoadedProductsSuccessState(
                      products: (state as LoadedProductsSuccessState).products
                        ..removeAt(index)
                        ..insert(index, prod.copyWith(in_favorites: true))))
                };
        } else {
          (state as LoadedProductsSuccessState).products[index].in_cart!
              ? emit(LoadedProductsSuccessState(
                  products: (state as LoadedProductsSuccessState).products
                    ..removeAt(index)
                    ..insert(index, prod.copyWith(in_cart: false))))
              : emit(LoadedProductsSuccessState(
                  products: (state as LoadedProductsSuccessState).products
                    ..removeAt(index)
                    ..insert(index, prod.copyWith(in_cart: true))));
        }
      }
    });

    on<GetProductEvent>((event, emit) async {
      emit(LoadingGetProductsState());
      Either<bool, List<ProductModel>> either;
      ProductRepository productRepository = ProductRepository();
      either = await productRepository.getproduct();

      either.fold((l) => emit(FailedToGetProductsState()),
          (r) => emit(LoadedProductsSuccessState(products: r)));
    });
  }
}
