import 'package:dartz/dartz.dart';

import '../../models/product_model.dart';

abstract class BaseProductRepository {
  Future<Either<bool, List<ProductModel>>> getproduct();
}
