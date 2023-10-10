import 'package:dartz/dartz.dart';
import 'package:e_commerce/models/banner_model.dart';

abstract class BasebannerRepository {
  Future<Either<bool, List<BannerModel>>> getallbanners();
  
}
