import 'package:bootcamp101/app/modules/auth/models/user.dart';
import 'package:equatable/equatable.dart';

enum AuthStatus { initial, loading, success, failed }

extension AuthStateExtension on AuthStatus {
  bool get isIntitial => this == AuthStatus.initial;
  bool get isLoading => this == AuthStatus.loading;
  bool get isSuccess => this == AuthStatus.success;
  bool get isFailed => this == AuthStatus.failed;
}

class AuthState extends Equatable {
  const AuthState({required this.users, this.status = AuthStatus.initial});
  final AuthStatus status;
  final List<User> users;

  factory AuthState.initial() {
    return const AuthState(users: []);
  }

  AuthState copyWith({
    AuthStatus? status,
    List<User>? users,
  }) {
    return AuthState(status: status ?? this.status, users: users ?? this.users);
  }

  @override
  List<Object?> get props => [status];
}
