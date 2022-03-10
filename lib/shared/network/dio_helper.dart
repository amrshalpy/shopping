import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://student.valuxapps.com/api/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> putData({
    required String path,
    String? token,
    String lang = 'en',
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
  }) async {
    dio.options = BaseOptions(headers: {
      'Content_Type': 'application/json',
      'Authorization': token,
      'lang': lang
    });
    return await dio.put(path, data: data, queryParameters: query!);
  }

  static Future<Response> postData({
    required String path,
    String token = '',
    String lang = 'en',
    required Map<String, dynamic> data,
  }) async {
    dio.options.headers = {
      'Content_Type': 'application/json',
      'Authorization': token,
      'lang': lang
    };
    return await dio.post(path, data: data);
  }

  static Future<Response> getData({
    required String path,
    String token = '',
    String lang = 'en',
  }) async {
    dio.options.headers = {
      'Content_Type': 'application/json',
      'Authorization': token,
      'lang': lang
    };
    return await dio.get(path);
  }

  static Future<Response> deleteData({
    required String path,
    String? token,
    String lang = 'en',
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token!,
      'lang': lang
    };
    return await dio.delete(path, data: data, queryParameters: query!);
  }
}
