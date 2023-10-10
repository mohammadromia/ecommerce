// ignore_for_file: must_be_immutable

part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

final class CartInitial extends CartState {}
final class LoadingCartState extends CartState {}

final class ErrorCartState extends CartState {}

class LoadedCartState extends CartState {
  List<ProductModel> carts;
  int totalPrice;
  LoadedCartState(
      {required this.carts, required this.totalPrice});
}
