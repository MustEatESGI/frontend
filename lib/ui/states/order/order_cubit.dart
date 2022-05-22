import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:must_eat_gui/models/command.dart';
import 'package:must_eat_gui/services/order.dart';
import 'package:must_eat_gui/services/search.dart';

import '../../../models/meal.dart';

part 'order_state.dart';

part 'order_cubit.freezed.dart';

class OrderCubit extends Cubit<OrderState> {
  final Search _search;
  final Order _order;

  OrderCubit(this._search, this._order) : super(OrderState.initial());

  void createCommand(String userID, String restaurantID, Meal meal) async {
    final command = Command(userId: userID, restaurantId: restaurantID, mealIds: [meal.id!]);
    emit(state.copyWith(command: command, meals: [meal]));
  }

  void addMeal(Meal meal) {
    state.command?.mealIds = [...?state.command?.mealIds, meal.id!];
    emit(state.copyWith(meals: [...?state.meals, meal], command: state.command));
  }

  void removeMeal(int index) {
    state.command?.mealIds?.removeAt(index);
    state.meals?.removeAt(index);
    emit(state);
  }

  void computeTotalPrice() async {
    double total = 00.00;
    if (state.command == null) emit(state.copyWith(totalPrice: total.toString()));
    final mealsIds = state.command?.mealIds;
    final meals = await Future.wait(mealsIds!
        .map((meal) async => await _search.searchSingleMealByID(meal))
        .toList());

    for (var element in meals) {
      total += element.price!;
    }
    emit(state.copyWith(totalPrice: total.toString()));
  }

  void payCommand(BuildContext context) async{
    final commandID = await _order.submitCart(state.command!);
    if(commandID.isNotEmpty){
      emit(state.copyWith(isPaid: true, isLoading: true));
      await Future.delayed(const Duration(seconds: 4));
      emit(OrderState.initial());
      context.go('/');
    }
  }

  void clearCommand() {
    emit(OrderState.initial());
  }
}
