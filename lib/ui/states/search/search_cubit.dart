import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:must_eat_gui/models/meal.dart';
import 'package:must_eat_gui/models/restaurant.dart';
import 'package:must_eat_gui/services/search.dart';

part 'search_state.dart';
part 'search_cubit.freezed.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._searchService) : super(SearchState.initial());

  final Search _searchService;

  void getTrendyRestaurants() async{
    // final restaurants = await _searchService.searchTrendyRestaurants();
    // TODO RM
    final restaurants = List.generate(30, (index) => Restaurant(id: index.toString(), name: 'name $index', distance: index.toString() + ' km', imageUrl: 'https://picsum.photos/200/300'));
    final nextState = state.copyWith(isTrendy: true, restaurants: restaurants);
    emit(nextState);
  }

  void getByMealAndFilter(String name) async{
    if(name.isEmpty ||  name == ''){
      emit(state.copyWith(isTrendy: true));
    }else{
      //final meals = await _searchService.searchByMeal(name, state.filter);
      // TODO RM
      final meals = List.generate(30, (index) => Meal(id: index.toString(), name: 'name $index', price: index.toDouble(), imageUrl: 'https://picsum.photos/200/300'));
      final nextState = state.copyWith(isTrendy: false, meals: meals);
      emit(nextState);
    }
  }


  void onFiltersChanged(List<String> filters) {
    final f = fromFiltersToSortType(filters);
    emit(state.copyWith(filter: f));
  }

}



enum SearchFilter{
  distance, price, ratio
}

String fromFiltersToSortType(List<String> filters) {
  final l = [];
  for(var i = 0 ; i < filters.length ; i++){
    final f = filters[i];
    if(f == SearchFilter.distance.name){
      l.add(SearchFilter.distance);
    }
    if(f == SearchFilter.price.name){
      l.add(SearchFilter.price);
    }
  }
  if(l.isEmpty){
    return "";
  }else if(l.length == 2){
    return "ratio";
  }else {
    return l.first == SearchFilter.distance ?  "distanmce" :  "price";
  }
}