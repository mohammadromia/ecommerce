import 'package:dartz/dartz.dart';
import 'package:e_commerce/models/category_model.dart';

abstract class BaseCategoryRepository {
  Future<Either<bool, List<CategoryModel>>> getAllCategories();
  
}
