import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:must_eat_gui/core/injection.dart';
import 'package:must_eat_gui/models/meal.dart';
import 'package:must_eat_gui/models/restaurant.dart';
import 'package:must_eat_gui/services/search.dart';

part 'search_state.dart';

part 'search_cubit.freezed.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._searchService) : super(SearchState.initial());

  final Search _searchService;
  final String accessToken = "Bearer ${kCreds.access_token!}";

  void reset() {
    emit(SearchState.initial());
    getTrendyRestaurants();
  }

  void getTrendyRestaurants() async {
    final restaurants = await _searchService.searchTrendyRestaurants(accessToken);
    final nextState = state.copyWith(isTrendy: true, restaurants: restaurants);
    emit(nextState);
  }

  void getByMealAndFilter(String name) async {
    if (name.isEmpty || name == '') {
      emit(state.copyWith(isTrendy: true));
    } else {
      final meals = await _searchService.searchByMeal(accessToken,name, state.filter);
      final nextState = state.copyWith(isTrendy: false, meals: meals, mealName: name);
      emit(nextState);
    }
  }

  void onFiltersChanged(List<String> filters) {
    final f = fromFiltersToSortType(filters);
    emit(state.copyWith(filter: f));
    if(state.mealName != null){
      getByMealAndFilter(state.mealName!);
    }
  }

  void getRestaurantAndMeals(String restaurantID) async {
    final restaurant = await _searchService.searchRestaurantByID(accessToken, restaurantID);

    final nextState = state.copyWith(restaurant: restaurant);
    emit(nextState);
  }
}

enum SearchFilter { distance, price, ratio }

String fromFiltersToSortType(List<String> filters) {
  final String filter = filters.first;

  switch(filter){
    case 'distance':
      return SearchFilter.distance.name;
    case 'price':
      return SearchFilter.price.name;
    default:
      return SearchFilter.ratio.name;
  }
  final l = [];
  for (var i = 0; i < filters.length; i++) {
    final f = filters[i];
    if (f == SearchFilter.distance.name) {
      l.add(SearchFilter.distance);
    }
    if (f == SearchFilter.price.name) {
      l.add(SearchFilter.price);
    }
  }
  if (l.isEmpty) {
    return "";
  } else if (l.length == 2) {
    return "ratio";
  } else {
    return l.first == SearchFilter.distance ? "distance" : "price";
  }
}
