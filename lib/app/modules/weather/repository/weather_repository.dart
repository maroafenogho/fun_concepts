import 'package:bootcamp101/app/models/weather_model.dart';
import 'package:bootcamp101/app/modules/weather/services/api_client.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:bootcamp101/modules/app/modules/weather/services/api_client.dart';

class WeatherRepository {
  WeatherRepository({ApiClient? apiClient})
      : _apiClient = apiClient ?? ApiClient();

  final ApiClient _apiClient;

  Future<List<Weather>> getWeather() async {
    final List<Weather> weatherList = [];
    final position = await _apiClient.getLocation();
    final weatherReturn = await _apiClient.getWeather(
        lat: position.latitude, long: position.longitude);
    for (final item in weatherReturn) {
      weatherList.add(Weather(
          description: item.description,
          temp: item.temp,
          locationName: item.locationName));
    }
    return weatherList;
  }
}
