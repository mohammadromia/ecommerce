// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

part of 'product_bloc.dart';

@immutable
abstract class ProductState {


}

final class ProductInitial extends ProductState {}



class LoadedProductsSuccessState extends ProductState {
  List<ProductModel> products;
  LoadedProductsSuccessState({
    required this.products,
  }) ;
}

class LoadingGetProductsState extends ProductState {}

class FailedToGetProductsState extends ProductState {}

class FilterProductsSuccessState extends ProductState {}


class LoadingGetFavoraitesState extends ProductState {}

class LoadedFavoritesState extends ProductState {
  List<ProductModel> favorites;

  Set<String> favoritesID;
  LoadedFavoritesState({
    required this.favorites,
    required this.favoritesID,
  });
}

class FailedGetFavoritesState extends ProductState {}

class AddOrRemoveItemFromFavoritesSuccessState extends ProductState {}

class FailedToAddOrRemoveItemFromFavoritesState extends ProductState {}
