import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:must_eat_gui/core/injection.dart';
import 'package:must_eat_gui/models/command.dart';
import 'package:must_eat_gui/services/order.dart';
import 'package:must_eat_gui/services/search.dart';

import '../../../models/meal.dart';

part 'order_state.dart';

part 'order_cubit.freezed.dart';

class OrderCubit extends Cubit<OrderState> {
  final Order _order;
  final String accessToken = "Bearer ${kCreds.access_token!}";

  OrderCubit(this._order) : super(OrderState.initial());

  void createCommand(String userID, String restaurantID, Meal meal) async {
    final command = Command(
        userId: userID,
        restaurantId: restaurantID,
        mealsId: [meal.id!.toString()]);
    emit(state.copyWith(command: command, meals: [meal]));
  }

  void addMeal(Meal meal, String restaurantID) {
    if ((state.meals != null && state.command?.restaurantId != null) &&
        (restaurantID != state.command!.restaurantId!.toString())) {
      final command = Command(
          userId: kCreds.user_id,
          restaurantId: restaurantID,
          mealsId: [meal.id!.toString()]);
      emit(state.copyWith(command: command, meals: [meal]));
    } else {
      emit(state.copyWith(meals: [...?state.meals, meal]));
      if (state.command == null) {
        final command = Command(
            userId: kCreds.user_id,
            restaurantId: restaurantID,
            mealsId: [meal.id!.toString()]);
        emit(state.copyWith(command: command));
      } else {
        state.command?.mealsId = [
          ...?state.command?.mealsId,
          meal.id!.toString()
        ];
      }
      emit(state.copyWith(command: state.command));
    }
  }

  void removeMeal(int index) {
    state.command?.mealsId?.removeAt(index);
    state.meals?.removeAt(index);
    emit(state);
  }

  void computeTotalPrice() async {
    double total = 00.00;
    if (state.command == null || state.command!.mealsId!.isEmpty) {
      emit(state.copyWith(totalPrice: total.toString()));
      return;
    }
    final meals = state.meals;

    for (var element in meals!) {
      total += element.price!;
    }
    emit(state.copyWith(totalPrice: convertPrice(total)));
  }

  void payCommand(BuildContext context) async {
    try {
      final commandID = await _order.submitCart(accessToken, state.command!);
      if (commandID.isNotEmpty) {
        emit(state.copyWith(isPaid: true, isLoading: true));
        await Future.delayed(const Duration(seconds: 1));
        emit(OrderState.initial());
        context.go('/');
      }
    } catch (e) {
      print(e);
    }
  }

  void clearCommand() {
    emit(OrderState.initial());
  }
}
