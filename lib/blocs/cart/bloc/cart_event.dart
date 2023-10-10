// ignore_for_file: must_be_immutable

part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}
class GetCartEvent extends CartEvent {}
class AddToCartEvent extends CartEvent {

ProductModel pm;
  AddToCartEvent({
    required this.pm,
  });
  

}
