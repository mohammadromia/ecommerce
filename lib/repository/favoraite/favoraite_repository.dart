import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../../api/apiservice.dart';
import '../../models/product_model.dart';
import '../../core/constants/constants.dart';
import 'base_favoriate_repository.dart';
import 'package:http/http.dart' as http;

class FavoraiteRepository extends BaseFavoraiteRepository {
  @override
  Future<Either<bool, List<ProductModel>>> getproductfavoraite() async {
    List<ProductModel> favorites = [];
    http.Response response =
        await Service().getusetoken('favorites', userToken!);

    var responseBody = jsonDecode(response.body);

    if (responseBody['status'] == true) {
      for (var item in responseBody['data']['data']) {
        favorites.add(ProductModel.fromJsoncart(data: item['product']));
      }

      return Right(favorites);
    }
    return const Left(false);
  }

  @override
  Future addandremoveproductfavoraite(var data) async {
    http.Response response =
        await Service().postusetoken('favorites', data, userToken!);

    var responseBody = jsonDecode(response.body);
    return responseBody['status'];
  }
}
