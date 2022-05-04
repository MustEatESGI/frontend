part of 'search_cubit.dart';

@freezed
class SearchState with _$SearchState {
  const SearchState._();
const factory SearchState({
    required bool isLoading,
}) = _SearchState;

factory SearchState.initial() => const SearchState(isLoading: false);
}
