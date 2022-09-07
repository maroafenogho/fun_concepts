import 'package:bootcamp101/app/modules/house/models/house.dart';
import 'package:bootcamp101/app/modules/house/services/home_api_client.dart';

class HouseRepository {
  HouseRepository({HomeApiClient? homeApiClient})
      : _homeApiClient = homeApiClient ?? HomeApiClient();
  final HomeApiClient _homeApiClient;

  Future<List<House>> getHouses() async {
    final houseList = <House>[];
    final houses = await _homeApiClient.getHouses();
    for (final item in houses) {
      houseList.add(House(
          title: item.title,
          description: item.description,
          price: item.price,
          duration: item.duration,
          image: item.image,
          location: item.location));
    }
    return houseList;
  }
}
