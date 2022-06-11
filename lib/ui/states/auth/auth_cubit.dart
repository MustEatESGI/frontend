import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:must_eat_gui/core/injection.dart';
import 'package:must_eat_gui/models/credentials.dart';
import 'package:must_eat_gui/models/location.dart';
import 'package:must_eat_gui/models/user.dart';
import 'package:must_eat_gui/services/authentication.dart';

part 'auth_state.dart';

part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  final Authentication _authentication;




  AuthCubit(this._authentication) : super(AuthState.initial());

  bool get isValidForm => state.email != null && state.password != null && state.email!.length > 2 && state.password!.length > 2;

  void onQuickLogin(BuildContext context) {
    emit(state.copyWith(isLoggedIn: true));
    context.go('/');
  }

  void onEmailChange(String email) {
    emit(state.copyWith(email: email));
  }

  void onPasswordChange(String pw) {
    emit(state.copyWith(password: pw));
  }

  void onSignIn(BuildContext context) async {
    if(!isValidForm) return;
    final user = User(username: state.email, password: state.password);
    try{
      final res = await _authentication.signIn(user.username!, user.password!);
      kCreds = res;
      emit(state.copyWith(isLoggedIn: true));
      context.go('/');
    }catch (e) {
      final p = e;
    }

  }

  void onSignUp(BuildContext context) async {
    if(!isValidForm) return;
    final user = User(username: state.email, password: state.password, location: Location(latitude: 41.5, longitude: 2.5));
    try{
      await _authentication.signUp(user);
      emit(state.copyWith(isLoggedIn: false));
      GoRouter.of(context).refresh();
    }catch (e) {
      final p = e;
    }

  }
}
