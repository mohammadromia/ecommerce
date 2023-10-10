import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../../api/apiservice.dart';
import '../../models/category_model.dart';
import 'base_categor_repository.dart';
import 'package:http/http.dart' as http;

class CategoryRepository extends BaseCategoryRepository {
  @override
  Future<Either<bool, List<CategoryModel>>> getAllCategories() async {
    List<CategoryModel> categories = [];
    http.Response response = await Service().get('categories');

    final responseBody = jsonDecode(response.body);
    if (responseBody['status'] == true) {
      for (var item in responseBody['data']['data']) {
        categories.add(CategoryModel.fromJson(data: item));
      }
      return Right(categories);
    }
    return const Left(false);
  }
}
