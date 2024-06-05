import 'package:dio/dio.dart';
import 'package:seatu_ersih/app/api/api_endpoint.dart';
import 'package:seatu_ersih/app/api/dio_instance.dart';

class AddAddressService {
  final DioInstance dioInstance = DioInstance();

  Future<Response> addAddress(FormData formData) async {
    try {
      final response = await dioInstance.postRequest(
        endpoint: ApiEndpoint.baseUrladdaddress,
        isAuthorize: true,
        data: formData,
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
