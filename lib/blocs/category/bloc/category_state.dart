// ignore_for_file: must_be_immutable

part of 'category_bloc.dart';

@immutable
abstract class CategoryState {}

final class CategoryInitial extends CategoryState {}
final class LoadingCategorystate extends CategoryState {}
final class LoadedCategorystate extends CategoryState {

  List<CategoryModel> categories;
LoadedCategorystate({required this.categories});
}
final class ErrorCategoryState extends CategoryState {}
