import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:must_eat_gui/services/search.dart';

part 'search_state.dart';
part 'search_cubit.freezed.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._searchService) : super(SearchState.initial());

  final Search _searchService;



  void getDefault(){}

  void getByMeal(String name){}

  void filterByPrice(){}

  void filterByDistance(){

  }

}
