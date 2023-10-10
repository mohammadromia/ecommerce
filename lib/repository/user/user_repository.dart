import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/models/user_model.dart';

import '../../api/apiservice.dart';
import '../../core/constants/constants.dart';
import 'base_user_repository.dart';
import 'package:http/http.dart' as http;

class UserRepository extends BaseUserRepository {
  @override
  Future<Either<bool, UserModel>> getinfouser() async {
    http.Response response = await Service().getusetoken('profile', userToken!);

    var responseData = jsonDecode(response.body);

    if (responseData['status'] == true) {
      UserModel userModel = UserModel.fromJson(data: responseData['data']);
      return Right(userModel);
    } else {
      return const Left(false);
    }
  }

  @override
  Future updateuserdata(data) async {
    http.Response response =
        await Service().put('update-profile', data, userToken!);

    var responseBody = jsonDecode(response.body);

    return responseBody['status'];
  }

  @override
  Future changepassword(data) async {
    http.Response response =
        await Service().postusetoken('change-password', data, userToken!);
    var responseDecoded = jsonDecode(response.body);
    return responseDecoded['status'];
  }
}
