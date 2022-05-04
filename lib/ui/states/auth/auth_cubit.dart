import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';

part 'auth_state.dart';

part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState.initial());

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

  void onSignIn(BuildContext context) {
    if(!isValidForm) return;
    emit(state.copyWith(isLoggedIn: true));
    context.go('/');
  }

  void onSignUp(BuildContext context) {
    if(!isValidForm) return;
    emit(state.copyWith(isLoggedIn: true));
    context.go('/');
  }
}
