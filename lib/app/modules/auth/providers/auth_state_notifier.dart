import 'package:bootcamp101/app/modules/auth/models/user.dart';
import 'package:bootcamp101/app/modules/auth/providers/auth_state.dart';
import 'package:bootcamp101/app/modules/auth/repository/auth_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepository(),
);

final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref.watch(authRepositoryProvider));
});

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(this._authRepository) : super(AuthState.initial());
  final AuthRepository _authRepository;

  reset() {
    state = state.copyWith(status: AuthStatus.initial);
  }

  signUp(String name, String email, String password) async {
    state = state.copyWith(status: AuthStatus.loading);
    try {
      final userList = <User>[];
      final signUp = await _authRepository.signUp(
          name: name, email: email, password: password);
      for (final user in signUp) {
        userList.add(User(name: user.name, email: user.email));

        state = state.copyWith(status: AuthStatus.success, users: userList);
      }
    } on Exception {
      state = state.copyWith(status: AuthStatus.failed);
    }
  }
}
