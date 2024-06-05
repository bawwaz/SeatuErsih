import 'package:dio/dio.dart';
import 'package:seatu_ersih/app/api/api_endpoint.dart';
import 'package:seatu_ersih/app/api/dio_instance.dart';

class AuthenticationService {
  final DioInstance dioInstance = DioInstance();

  Future<Response> logoutService() async {
    try {
      final response = await dioInstance.deleteRequest(
        endpoint: ApiEndpoint.baseUrlLogout,
        isAuthorize: true,
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
