import 'package:bootcamp101/app/modules/auth/services/auth_api_client.dart';

import '../models/user.dart';

class AuthRepository {
  AuthRepository({AuthApiClient? authApiClient})
      : _authApiClient = authApiClient ?? AuthApiClient();

  final AuthApiClient _authApiClient;

  Future<List<User>> signUp(
      {required String name,
      required String email,
      required String password}) async {
    final List<User> userList = [];
    final signUp = await _authApiClient.signUp(
        name: name, email: email, password: password);
    for (final item in signUp) {
      userList.add(User(name: item.name, email: item.email));
    }
    return userList;
  }

  Future<List<User>> signIn(
      {required String email, required String password}) async {
    final List<User> userList = [];
    final signIn =
        await _authApiClient.signIn(email: email, password: password);
    for (final item in signIn) {
      userList.add(User(
        name: item.name,
        email: item.email,
        token: item.token,
      ));
    }
    return userList;
  }
}
