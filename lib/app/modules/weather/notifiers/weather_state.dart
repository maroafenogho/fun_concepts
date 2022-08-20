import 'package:bootcamp101/app/models/weather_model.dart';
import 'package:equatable/equatable.dart';

enum WeatherStatus { initial, loading, success, failure }

extension WeatherStatusX on WeatherStatus {
  bool get isInitial => this == WeatherStatus.initial;
  bool get isLoading => this == WeatherStatus.loading;
  bool get isSuccess => this == WeatherStatus.success;
  bool get isFailure => this == WeatherStatus.failure;
}

class WeatherState extends Equatable {
  const WeatherState(
      {required this.weathers, this.status = WeatherStatus.initial});
  final WeatherStatus status;
  final List<Weather> weathers;

  factory WeatherState.initial() {
    return const WeatherState(
      weathers: [],
    );
  }

  WeatherState copyWith({
    WeatherStatus? status,
    List<Weather>? weathers,
  }) {
    return WeatherState(
        status: status ?? this.status, weathers: weathers ?? this.weathers);
  }

  @override
  List<Object?> get props => [status];
}
