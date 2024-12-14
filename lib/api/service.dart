import 'package:dio/dio.dart';

class DataService {
  final String _url = "http://localhost:8000/api/";

  Dio dio = Dio();

  LoginService(String username, String password) async {
    final response = await dio.post(_url + 'loginuser', data: {
      'username': username,
      'password': password,
    });
    return response.data;
  }
}
