import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final String description;
  final double temp;
  final String locationName;

  const Weather(
      {required this.description,
      required this.temp,
      required this.locationName});

  factory Weather.fromJson(Map<String, dynamic> map) {
    return Weather(
        description: map['weather'][0]['description'],
        temp: map['main']['temp'],
        locationName: map['name']);
  }

  @override
  List<Object?> get props => [
        description,
        temp,
        locationName,
      ];
}
