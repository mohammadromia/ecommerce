// ignore_for_file: must_be_immutable

part of 'favoraite_bloc.dart';

@immutable
abstract class FavoraiteEvent {}
class GetFavoriteEvent extends FavoraiteEvent {}
class AddfavoraiteEvent extends FavoraiteEvent {

ProductModel pm;
  AddfavoraiteEvent({
    required this.pm,
  });
  

}
