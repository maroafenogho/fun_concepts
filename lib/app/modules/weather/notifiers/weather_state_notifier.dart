import 'package:bootcamp101/app/modules/weather/notifiers/weather_state.dart';
import 'package:bootcamp101/app/modules/weather/repository/weather_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../models/weather_model.dart';

final weatherRepositoryProvider = Provider<WeatherRepository>(
  (ref) => WeatherRepository(),
);

final weatherNotifierProvider =
    StateNotifierProvider<WeatherNotifier, WeatherState>((ref) {
  return WeatherNotifier(ref.watch(weatherRepositoryProvider));
});

class WeatherNotifier extends StateNotifier<WeatherState> {
  WeatherNotifier(this._weatherRepository) : super(WeatherState.initial());
  final WeatherRepository _weatherRepository;

  getWeather() async {
    state = state.copyWith(status: WeatherStatus.loading);
    try {
      final weatherList = <Weather>[];
      final weather = await _weatherRepository.getWeather();

      for (final item in weather) {
        weatherList
            .add(Weather(description: item.description, temp: item.temp - 273));
        state = state.copyWith(
            status: WeatherStatus.success, weathers: weatherList);
      }
    } on Exception {
      state = state.copyWith(status: WeatherStatus.failure);
    }
    // state.status WeatherStatus.loading;
  }
}
