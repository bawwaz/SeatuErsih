import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String baseUrl = 'http://seatuersih.pradiptaahmad.tech/api';

  Future<void> registerUser(Map<String, String> data) async {
    final url = Uri.parse('$baseUrl/users/register');
    final response = await http.post(url, body: data, headers: {
      'Accept': 'application/json',
    });

    if (response.statusCode == 201) {
      // Handle success
      print('User registered successfully');
    } else {
      // Handle error
      print('Failed to register user: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to register user');
    }
  }
}
