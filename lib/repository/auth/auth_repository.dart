import 'dart:convert';

import '../../api/apiservice.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/constants.dart';
import '../../core/network/localnetwork.dart';
import 'base_auth_repository.dart';

class AuthRepository extends BaseAuthRepository {
  @override
  Future<bool> login(var data) async {
    http.Response response = await Service().post('login', data);

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      if (responseData['status'] == true) {
        await CacheNetwork.insertToCache(
            key: "token", value: responseData['data']['token']);
        await CacheNetwork.insertToCache(
            key: "password", value: data['password']);
        userToken = await CacheNetwork.getCacheData(key: "token");
        currentPassword = await CacheNetwork.getCacheData(key: "password");
        return true;
      }
    }
    return false;
  }

  @override
  Future<bool> signup(data) async {
    http.Response response = await Service().post('register', data);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data['status'] == true) {
        return true;
      }
    }
    return false;
  }
}
