import 'package:bootcamp101/app/models/weather_model.dart';
import 'package:bootcamp101/constants.dart';
// import 'package:bootcamp101/modules/models/weather_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiClient {
  Future<List<Weather>> getWeather() async {
    List<Weather> weatherList = [];
    final response = await http.get(Uri.parse(
        '${AppConstants.baseUrl}/data/2.5/weather?lat=37.6237&lon=-121.8842&appid=${AppConstants.apiKey}'));
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      weatherList.add(Weather.fromJson(jsonResponse));
      // print(weatherList);
      return weatherList;
    } else {
      return [];
    }
  }
}
