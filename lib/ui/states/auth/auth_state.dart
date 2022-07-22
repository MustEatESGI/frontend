part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const AuthState._();

  const factory AuthState({
    required bool isLoggedIn,
    String? email,
    String? password,
    String? address,
  }) = _AuthState;

  factory AuthState.initial() => const AuthState(isLoggedIn: false);
}
