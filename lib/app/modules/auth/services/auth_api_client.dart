import 'package:bootcamp101/app/modules/auth/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthApiClient {
  static const baseUrl =
      'https://pacific-shore-70749.herokuapp.com/api/v1/auth';

  Future<List<User>> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    List<User> user = [];
    final response = await http.post(Uri.parse('$baseUrl/signup'));
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      if (jsonResponse['status'] == 'SUCCESS') {
        user.add(User.fromJson(jsonResponse["data"]));
      }
    }
    return user;
  }
}
