import 'package:bootcamp101/app/modules/house/models/house.dart';
import 'package:equatable/equatable.dart';

enum HouseStatus { initial, loading, success, failed }

extension HouseStateExtension on HouseStatus {
  bool get isIntitial => this == HouseStatus.initial;
  bool get isLoading => this == HouseStatus.loading;
  bool get isSuccess => this == HouseStatus.success;
  bool get isFailed => this == HouseStatus.failed;
}

class HouseState extends Equatable {
  const HouseState({required this.houses, this.status = HouseStatus.initial});
  final List<House> houses;
  final HouseStatus status;

  factory HouseState.initial() {
    return const HouseState(houses: []);
  }

  HouseState copyWith({
    HouseStatus? status,
    List<House>? houses,
  }) {
    return HouseState(
        status: status ?? this.status, houses: houses ?? this.houses);
  }

  @override
  List<Object?> get props => [status];
}
