import 'package:bootcamp101/app/modules/house/models/house.dart';
import 'package:bootcamp101/app/modules/house/providers/house_state.dart';
import 'package:bootcamp101/app/modules/house/repository/home_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final houseRepositoryProvider =
    Provider<HouseRepository>((ref) => HouseRepository());

final houseNotifierProvider =
    StateNotifierProvider<HouseNotifier, HouseState>((ref) {
  return HouseNotifier(ref.watch(houseRepositoryProvider));
});

class HouseNotifier extends StateNotifier<HouseState> {
  HouseNotifier(this._houseRepository) : super(HouseState.initial());
  final HouseRepository _houseRepository;

  getHouses() async {
    state = state.copyWith(status: HouseStatus.loading);
    try {
      final houseList = <House>[];
      final houses = await _houseRepository.getHouses();
      for (final house in houses) {
        houseList.add(
          House(
              title: house.title,
              description: house.description,
              price: house.price,
              duration: house.duration,
              image: house.image,
              location: house.location),
        );
        print(house.image);
        print(house.location.houseNumber);
      }
      state = state.copyWith(status: HouseStatus.success, houses: houseList);
    } on Exception {
      state = state.copyWith(status: HouseStatus.failed);
    }
  }
}
