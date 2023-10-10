import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/models/banner_model.dart';

import '../../api/apiservice.dart';
import 'package:http/http.dart' as http;

import 'base_banner_repository.dart';

class BannnerRepository extends BasebannerRepository {
  @override
  Future<Either<bool, List<BannerModel>>> getallbanners() async {
    List<BannerModel> banners = [];
    http.Response response = await Service().get('banners');

    final responseBody = jsonDecode(response.body);
    if (responseBody['status'] == true) {
      for (var item in responseBody['data']) {
        banners.add(BannerModel.fromJson(data: item));
      }
      return Right(banners);
    }
    return const Left(false);
  }


}
