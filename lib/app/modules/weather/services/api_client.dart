import 'package:bootcamp101/app/models/weather_model.dart';
import 'package:bootcamp101/constants.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiClient {
  Future<List<Weather>> getWeather(
      {required double lat, required double long}) async {
    List<Weather> weatherList = [];
    // await getLocation();
    final response = await http.get(Uri.parse(
        '${AppConstants.baseUrl}/data/2.5/weather?lat=$lat&lon=$long&appid=${AppConstants.apiKey}'));
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      weatherList.add(Weather.fromJson(jsonResponse));
      // print(weatherList);
      return weatherList;
    } else {
      return [];
    }
  }

  Future<Position> getLocation() async {
    // print('ooo');
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    Position position = await Geolocator.getCurrentPosition().then((value) {
      return value;
    });

    return position;
  }
}
