import 'package:dio/dio.dart';
import 'package:goldy_app/core/networking/api_constants.dart';

class DioHelper {
  static late Dio dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: Duration(seconds: 20),
        receiveTimeout: Duration(seconds: 20),
        headers: {'Content-Type': 'application/json'},
      ),
    );
  }

  Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await dio.get(url, queryParameters: query);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
