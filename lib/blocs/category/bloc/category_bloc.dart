
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../models/category_model.dart';
import '../../../repository/categroy/category_repository.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    on<GetAllCaregoryEvent>((event, emit) async {
      emit(LoadingCategorystate());
      Either<bool, List<CategoryModel>> either;
      CategoryRepository categoryRepository = CategoryRepository();
      either = await categoryRepository.getAllCategories();

      either.fold((l) => emit(ErrorCategoryState()),
          (r) => emit(LoadedCategorystate(categories: r)));
    });
  }
}
