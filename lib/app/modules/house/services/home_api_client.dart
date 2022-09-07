import 'dart:io';

import 'package:bootcamp101/app/modules/auth/models/user.dart';
import 'package:bootcamp101/app/modules/house/models/house.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeApiClient {
  static const baseUrl = 'https://pacific-shore-70749.herokuapp.com/api/v1';

  Future<List<House>> getHouses() async {
    final houseList = <House>[];
    HttpClient client = HttpClient();
    HttpClientRequest request =
        await client.getUrl(Uri.parse('$baseUrl/house'));
    request.headers.set('content-type', 'Application/json');
    HttpClientResponse apiResponse = await request.close();
    final responseObject = await apiResponse.transform(utf8.decoder).join();
    debugPrint(responseObject.toString());
    if (apiResponse.statusCode == 200) {
      // debugPrint(jsonResponse.runtimeType.toString());

      List jsonResponse = jsonDecode(responseObject);
      for (final house in jsonResponse) {
        houseList.add(House.fromJson(house));
      }
    }
    return houseList;
  }
}
