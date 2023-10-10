import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../../api/apiservice.dart';
import '../../models/product_model.dart';
import '../../core/constants/constants.dart';
import 'base_product_repository.dart';
import 'package:http/http.dart' as http;

class ProductRepository extends BaseProductRepository {
  @override
  Future<Either<bool, List<ProductModel>>> getproduct() async {
    http.Response response = await Service().getusetoken('home', userToken!);

    var responseBody = jsonDecode(response.body);
    List<ProductModel> products = [];

    if (responseBody['status'] == true) {
      for (var item in responseBody['data']['products']) {
        products.add(ProductModel.fromJson(data: item));
      }
      return Right(products);
    }
    return const Left(false);
  }
}
