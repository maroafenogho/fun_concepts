import 'package:bootcamp101/app/modules/auth/services/auth_api_client.dart';
import 'package:bootcamp101/app/modules/weather/services/api_client.dart';

import '../models/user.dart';

class AuthRepository {
  AuthRepository({AuthApiClient? authApiClient})
      : authApiClient = authApiClient ?? AuthApiClient();

  final AuthApiClient authApiClient;

  Future<List<User>> signUp(
      {required String name,
      required String email,
      required String password}) async {
    final List<User> userList = [];
    final signUp = await authApiClient.signUp(
        name: name, email: email, password: password);
    for (final item in signUp) {
      userList.add(User(name: item.name, email: item.email));
    }
    return userList;
  }
}
