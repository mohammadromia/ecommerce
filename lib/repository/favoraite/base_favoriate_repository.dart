import 'package:dartz/dartz.dart';

import '../../models/product_model.dart';

abstract class BaseFavoraiteRepository {
  Future<Either<bool, List<ProductModel>>> getproductfavoraite();
    Future addandremoveproductfavoraite(var data);

}
