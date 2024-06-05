import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:seatu_ersih/app/api/api_endpoint.dart';

class DioInstance {
  late Dio _dio;

 DioInstance() {
    _dio = Dio(BaseOptions(
      baseUrl: ApiEndpoint.baseUrl,
      validateStatus: (status) {
        return status! < 500;
      },
    ));
    initializeInterceptors();
  }

  Future<Response> getRequest({
    required String endpoint,
    bool? isAuthorize,
    Map<String, dynamic>? queryParameters,
  }) async {
    Response response;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    try {
      response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: Options(headers: {
          "Accept": "application/json",
          if (isAuthorize ?? false) "Authorization": "Bearer $token"
        }),
      );
    } on DioException catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }

  Future<Response> postRequest({
    required String endpoint,
    bool? isAuthorize,
    Object? data,
  }) async {
    Response response;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (isAuthorize ?? false) {
      throw Exception("Token is null. Please log in again.");
    }

    try {
      response = await _dio.post(
        endpoint,
        data: data,
        options: Options(headers: {
          "Accept": "application/json",
          "Content-Type": 'multipart/form-data',
          if (isAuthorize ?? false) "Authorization": "Bearer $token"
        }),
      );
    } on DioException catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }

  Future<Response> putRequest({
    required String endpoint,
    bool? isAuthorize,
    required Object data,
  }) async {
    Response response;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    try {
      response = await _dio.put(
        endpoint,
        data: data,
        options: Options(headers: {
          "Accept": "application/json",
          if (isAuthorize ?? false) "Authorization": "Bearer $token"
        }),
      );
    } on DioException catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }

  Future<Response> deleteRequest({
    required String endpoint,
    bool? isAuthorize,
  }) async {
    Response response;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    try {
      response = await _dio.delete(
        endpoint,
        options: Options(headers: {
          "Accept": "application/json",
          if (isAuthorize ?? false) "Authorization": "Bearer $token"
        }),
      );
    } on DioException catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }

  initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (error, handler) {
        print("Request error: ${error.message}");
        return handler.next(error);
      },
      onRequest: (request, handler) {
        print("Request: ${request.method} ${request.path}");
        print("Request headers: ${request.headers}");
        print("Request data: ${request.data}");
        return handler.next(request);
      },
      onResponse: (response, handler) {
        print("Response: ${response.data}");
        return handler.next(response);
      },
    ));
  }
}
