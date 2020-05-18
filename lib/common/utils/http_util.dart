import 'package:dio/dio.dart';
import 'dart:async';
import 'package:flutter_boss/common/config/config.dart';

void getHttp() async {
  Response responseContent =
      await Dio().get('http://127.0.0.1:3000/api/jobs/list/1/');
  print(responseContent);

  try {
    Response response = await Dio().get("http://www.google.com");
    print(response);
  } catch (e) {
    print(e);
  }
}

class HttpUtil {
  static final HttpUtil _instance = HttpUtil._internal();

  Dio _client;

  factory HttpUtil() => _instance;

  HttpUtil._internal() {
    if (null == _client) {
      BaseOptions options = new BaseOptions(
        baseUrl: Config.BASE_URL,
        connectTimeout: 10 * 1000,
        receiveTimeout: 3 * 1000,
      );
      _client = new Dio(options);
    }
  }

  Future<Response<Map<String, dynamic>>> get(String path,
      [Map<String, dynamic> params]) async {
    Response<Map<String, dynamic>> response;
    getHttp();
    if (null != params) {
      print(777777);
      response = await _client.get(path, queryParameters: params);
    } else {
      print(888888);
      response = await _client.get(path);
      print(response);
    }
    return response;
  }
}
