import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://10.0.2.2:8086/',
        //baseUrl: 'http://127.0.0.1:8086/',
        receiveDataWhenStatusError: true,
        connectTimeout: Duration(seconds: 60),
        receiveTimeout: Duration(seconds: 60),
        headers: {'Content-Type': 'application/json'},
      ),
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic> ?data,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    dio.options.headers = {
      'Authorization': token != null ? 'Bearer $token' : '',
      'Content-Type': 'application/json',
    };
    return await dio.post(url, data: data,queryParameters: queryParameters);
  }
}
