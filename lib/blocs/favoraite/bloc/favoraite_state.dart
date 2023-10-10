// ignore_for_file: must_be_immutable

part of 'favoraite_bloc.dart';

@immutable
abstract class FavoraiteState {}

final class FavoraiteInitial extends FavoraiteState {}

final class LoadingFavoraiteState extends FavoraiteState {}

final class LoadedFavoraiteState extends FavoraiteState {
  List<ProductModel> favorites;
  LoadedFavoraiteState({required this.favorites});
}

final class FaliureFavoraiteState extends FavoraiteState {}
