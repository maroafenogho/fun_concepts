import 'package:bootcamp101/app/models/weather_model.dart';
import 'package:bootcamp101/app/modules/weather/services/api_client.dart';
// import 'package:bootcamp101/modules/app/modules/weather/services/api_client.dart';

class WeatherRepository {
  WeatherRepository({ApiClient? apiClient})
      : _apiClient = apiClient ?? ApiClient();

  final ApiClient _apiClient;

  Future<List<Weather>> getWeather() async {
    final List<Weather> weatherList = [];
    final weatherReturn = await _apiClient.getWeather();
    for (final item in weatherReturn) {
      weatherList.add(Weather(description: item.description, temp: item.temp));
    }
    return weatherList;
  }
}
