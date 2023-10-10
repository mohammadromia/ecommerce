import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../../api/apiservice.dart';
import '../../models/product_model.dart';
import '../../core/constants/constants.dart';
import 'base_favoriate_repository.dart';
import 'package:http/http.dart' as http;

class CartRepository extends BaseCartRepository {

  int totalPrice=0;
  int get gettotal=>totalPrice;
  @override
  Future<Either<bool, List<ProductModel>>> getproductcart() async {
    List<ProductModel> cart = [];
    http.Response response =
        await Service().getusetoken('carts', userToken!);

    var responseBody = jsonDecode(response.body);

    if (responseBody['status'] == true) {
      for (var item in responseBody['data']['cart_items']) {
        cart.add(ProductModel.fromJsoncart(data: item['product']));
      }
        totalPrice = responseBody['data']['total'];

      return Right(cart);
    }
    return const Left(false);
  }

  @override
  Future addandremoveproductcart(var data) async {
  http.Response response =
          await Service().postusetoken('carts', data, userToken!);
    var responseBody = jsonDecode(response.body);
    return responseBody['status'];
  }
}
