import 'dart:io';

import 'package:bootcamp101/app/modules/auth/models/user.dart';
import 'package:flutter/material.dart';
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
    final body = {
      'name': name,
      'email': email,
      'password': password,
    };
    List<User> user = [];
    HttpClient client = HttpClient();
    HttpClientRequest request =
        await client.postUrl(Uri.parse('$baseUrl/signup'));
    request.headers.set('content-type', 'Application/json');
    request.add(utf8.encode(json.encode(body)));
    HttpClientResponse apiResponse = await request.close();
    final responseObject = await apiResponse.transform(utf8.decoder).join();

    debugPrint(responseObject.toString());
    if (apiResponse.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(responseObject);
      debugPrint(jsonResponse.runtimeType.toString());

      if (jsonResponse['status'] == 'SUCCESS') {
        user.add(User.fromJson(jsonResponse["data"]));
      }
    }
    return user;
  }

  Future<List<User>> signIn({
    required String email,
    required String password,
  }) async {
    final body = {
      'email': email,
      'password': password,
    };
    List<User> user = [];
    HttpClient client = HttpClient();
    HttpClientRequest request =
        await client.postUrl(Uri.parse('$baseUrl/signin'));
    request.headers.set('content-type', 'Application/json');
    request.add(utf8.encode(json.encode(body)));
    HttpClientResponse apiResponse = await request.close();
    final responseObject = await apiResponse.transform(utf8.decoder).join();

    debugPrint(responseObject.toString());
    if (apiResponse.statusCode < 300) {
      Map<String, dynamic> jsonResponse = jsonDecode(responseObject);
      if (jsonResponse['status'] == 'SUCCESS') {
        user.add(User.fromJson(jsonResponse["data"][0]));
      }
      debugPrint(jsonResponse.runtimeType.toString());
    }
    return user;
  }
}
