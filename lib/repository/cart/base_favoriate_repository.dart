import 'package:dartz/dartz.dart';

import '../../models/product_model.dart';

abstract class BaseCartRepository {
  Future<Either<bool, List<ProductModel>>> getproductcart();
    Future addandremoveproductcart(var data);

}
