// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, camel_case_types
part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}





class GetProductEvent extends ProductEvent {}
 
class RefreshEvent extends ProductEvent {
ProductModel pm;
bool isfavoraite;

  RefreshEvent({
    required this.pm,
    this.isfavoraite=false
  });
  
}


class AddOrRemoveItemFromFavoritesEvent extends ProductEvent {
    Set<String> favoritesID ;

  String productID;
  AddOrRemoveItemFromFavoritesEvent({
    required this.favoritesID,
    required this.productID,
  });
}
