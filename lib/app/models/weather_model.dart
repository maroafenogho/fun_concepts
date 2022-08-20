import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  String description;
  double temp;

  Weather({required this.description, required this.temp});

  factory Weather.fromJson(Map<String, dynamic> map) {
    return Weather(
        description: map['weather'][0]['description'],
        temp: map['main']['temp']);
  }

  @override
  List<Object?> get props => [
        description,
        temp,
      ];
}
