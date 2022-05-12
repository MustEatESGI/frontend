part of 'search_cubit.dart';

@freezed
class SearchState with _$SearchState {
  const SearchState._();
const factory SearchState({
    required bool isLoading,
  required bool isTrendy,
  List<Restaurant>? restaurants,
  List<Meal>? meals,
  required String filter,
}) = _SearchState;

factory SearchState.initial() => const SearchState(isLoading: false, isTrendy: true, filter: "ratio");
}
