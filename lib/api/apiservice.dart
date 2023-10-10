// ignore_for_file: non_constant_identifier_names

import 'package:http/http.dart' as http;

class Service {
  String url='url';
  Future<http.Response> get(String endpoint) async {
    http.Response response = await http.get(
        Uri.parse("$url/$endpoint"),
        headers: {'lang': "en"});
    return response;
  }
  Future<http.Response> getusetoken(String endpoint,String userToken) async {
    http.Response response = await http.get(
        Uri.parse("$url/$endpoint"),
          headers: {"Authorization": userToken, "lang": "en"});
    return response;
  }
    Future<http.Response> postusetoken(String endpoint,var data,String userToken) async {
    http.Response response = await http.post(
        Uri.parse("$url/$endpoint"),
          headers: {"Authorization": userToken, "lang": "en"},
          body: data
          );

    return response;
  }
  
    Future<http.Response> post(String endpoint,var data) async {
    http.Response response = await http.post(
        Uri.parse("$url/$endpoint"),
          body: data
          );

    return response;
  }
       Future<http.Response> put(String endpoint,var data,String userToken) async {
    http.Response response = await http.put(
        Uri.parse("$url/$endpoint"),
          headers: {"Authorization": userToken, "lang": "en"},
          body: data
          );

    return response;
  }
}
