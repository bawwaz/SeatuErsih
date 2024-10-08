import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:seatu_ersih/app/api/api_endpoint.dart';

class Login {
  final String baseUrl = ApiEndpoint.baseUrl;

  Future<void> loginUser(Map<String, String> data) async {
    final url = Uri.parse('$baseUrl/Users/login');

    final response = await http.post(url, body: json.encode(data), headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 201) {
      // Handle success
      print('User logged in successfully');
    } else {
      // Handle error
      print('Failed to log in user: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to log in user');
    }
  }
}
